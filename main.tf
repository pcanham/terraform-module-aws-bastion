#resource "null_resource" "is_os_name_valid" {
#  count = contains(var.bastion_os_list, var.bastion_os) == true ? 0 : 1
#  "ERROR: The os value can only be: nix or win" = true
#}

data "aws_ami" "nix_jumpbox" {
  count       = (var.create_bastion == true && var.bastion_os == "nix") ? 1 : 0
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
}

data "aws_ami" "win_jumpbox" {
  count       = (var.create_bastion == true && var.bastion_os == "win") ? 1 : 0
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

resource "aws_iam_role" "bastion" {
  count              = var.create_bastion ? 1 : 0
  name               = "bastion"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ { "Effect": "Allow", "Principal": { "Service": "ec2.amazonaws.com" }, "Action": "sts:AssumeRole" } ]
}
EOF

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "bastion-%s-%s",
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}

resource "aws_iam_role_policy" "bastion" {
  count  = var.create_bastion ? 1 : 0
  name   = "bastion"
  role   = aws_iam_role.bastion[0].id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    { "Action" : ["ec2:AssociateAddress"], "Effect": "Allow", "Resource": ["*"] },
    { "Action": [ "logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogStreams" ], "Effect": "Allow", "Resource": [ "arn:aws:logs:*:*:*" ] }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "bastion" {
  count = var.create_bastion ? 1 : 0
  name  = "bastion"
  role  = aws_iam_role.bastion[0].name
}

resource "aws_eip" "bastion_ip" {
  count = var.create_bastion ? 1 : 0
  vpc   = true

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "bastion-eip-%s-%s",
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}

resource "aws_autoscaling_group" "autoscaling_group" {
  count       = var.create_bastion ? 1 : 0
  name_prefix = format("%s-bastion", var.bastion_os)

  launch_configuration = aws_launch_configuration.launch_configuration[0].name

  ## Disabling "availability_zones" due to terraform bug
  ##  https://github.com/hashicorp/terraform/issues/15978
  #availability_zones  = ["${var.availability_zones}"]
  vpc_zone_identifier = var.public_cidr_blocks

  min_size             = "1"
  max_size             = "1"
  desired_capacity     = "1"
  termination_policies = [var.termination_policies]

  health_check_type         = "EC2"
  health_check_grace_period = "300"
  wait_for_capacity_timeout = "10m"

  tag {
    key = "Name"
    value = lower(
      format(
        "%s-bastion-%s-%s-%s",
        var.bastion_os,
        var.project_tag,
        var.environment_tag,
        var.vpc_id,
      ),
    )
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

}


data "template_file" "nix_user-data" {
  count    = (var.create_bastion == true && var.bastion_os == "nix") ? 1 : 0
  template = file("${path.module}/user-data.sh")
  vars = {
    region            = var.aws_region
    eip-allocation-id = aws_eip.bastion_ip[0].id
  }
}

data "template_file" "win_user-data" {
  count    = (var.create_bastion == true && var.bastion_os == "win") ? 1 : 0
  template = file("${path.module}/user-data.sh")
  vars = {
    region            = var.aws_region
    eip-allocation-id = aws_eip.bastion_ip[0].id
  }
}

resource "aws_launch_configuration" "launch_configuration" {
  count         = var.create_bastion ? 1 : 0
  name_prefix   = "bastion"
  image_id      = var.ami_id == "" ? data.aws_ami.nix_jumpbox[0].image_id : var.ami_id
  instance_type = var.instance_type
  user_data     = data.template_file.nix_user-data[0].rendered
  spot_price    = ""

  iam_instance_profile        = aws_iam_instance_profile.bastion[0].name
  key_name                    = var.ssh_key_name
  security_groups             = [aws_security_group.bastion_security_group[0].id]
  associate_public_ip_address = var.associate_public_ip_address

  ebs_optimized = var.root_volume_ebs_optimized

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.root_volume_delete_on_termination
  }

  # Important note: whenever using a launch configuration with an auto scaling group, you must set
  # create_before_destroy = true. However, as soon as you set create_before_destroy = true in one resource, you must
  # also set it in every resource that it depends on, or you'll get an error about cyclic dependencies (especially when
  # removing resources). For more info, see:
  #
  # https://www.terraform.io/docs/providers/aws/r/launch_configuration.html
  # https://terraform.io/docs/configuration/resources.html
  lifecycle {
    create_before_destroy = true
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP TO CONTROL WHAT REQUESTS CAN GO IN AND OUT OF EACH EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "bastion_security_group" {
  count       = var.create_bastion ? 1 : 0
  name_prefix = "bastion"
  description = "Security group for the bastion launch configuration"
  vpc_id      = var.vpc_id

  # aws_launch_configuration.launch_configuration in this module sets create_before_destroy to true, which means
  # everything it depends on, including this resource, must set it as well, or you'll get cyclic dependency errors
  # when you try to do a terraform destroy.
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "sg-bastion-%s-%s-%s",
        var.project_tag,
        var.environment_tag,
        var.vpc_id,
      ),
      )
    }
  )
}

resource "aws_security_group_rule" "allow_ssh_inbound_bastion" {
  count             = (var.create_bastion == true && var.bastion_os == "nix") ? 1 : 0
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.cidr_whitelist
  security_group_id = aws_security_group.bastion_security_group[0].id
}

resource "aws_security_group_rule" "allow_rdp_inbound_bastion" {
  count             = (var.create_bastion == true && var.bastion_os == "win") ? 1 : 0
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = var.cidr_whitelist
  security_group_id = aws_security_group.bastion_security_group[0].id
}

resource "aws_security_group_rule" "allow_winrm_inbound_bastion" {
  count             = (var.create_bastion == true && var.bastion_os == "win") ? 1 : 0
  type              = "ingress"
  from_port         = 5985
  to_port           = 5986
  protocol          = "tcp"
  cidr_blocks       = var.cidr_whitelist
  security_group_id = aws_security_group.bastion_security_group[0].id
}

resource "aws_security_group_rule" "allow_all_outbound_bastion" {
  count             = var.create_bastion ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_security_group[0].id
}
