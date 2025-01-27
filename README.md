# AWS Bastion EC2 deployment

## Util
Applications used within this repo to help with CHANGELOG creation and also checking files within the repo

- [git-chglog](https://github.com/git-chglog/git-chglog)
- [semtag](https://github.com/pnikosis/semtag)
- [pre-commit](https://pre-commit.com/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.56.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.2 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.56.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/autoscaling_group) | resource |
| [aws_eip.bastion_ip](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/eip) | resource |
| [aws_iam_instance_profile.bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/iam_role_policy) | resource |
| [aws_launch_configuration.launch_configuration](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/launch_configuration) | resource |
| [aws_security_group.bastion_security_group](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_all_outbound_bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_rdp_inbound_bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_ssh_inbound_bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_winrm_inbound_bastion](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/resources/security_group_rule) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/id) | resource |
| [aws_ami.nix_jumpbox](https://registry.terraform.io/providers/hashicorp/aws/5.56.1/docs/data-sources/ami) | data source |
| [template_file.nix_user_data](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The ID of the AMI to run in the cluster. | `string` | `""` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | If set to true, associate a public IP address with each EC2 Instance in the cluster. | `bool` | `true` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to launch servers. | `string` | `""` | no |
| <a name="input_bastion_os"></a> [bastion\_os](#input\_bastion\_os) | Which operating system do you want (options: nix, win): | `string` | `"nix"` | no |
| <a name="input_cidr_whitelist"></a> [cidr\_whitelist](#input\_cidr\_whitelist) | CIDR Whitelist | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_create_bastion"></a> [create\_bastion](#input\_create\_bastion) | Boolean create bastion true or false | `bool` | `true` | no |
| <a name="input_custom_suffix"></a> [custom\_suffix](#input\_custom\_suffix) | enter a suffix which will be tagged to all created objects, if not set a random one will be assigned | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_public_cidr_blocks"></a> [public\_cidr\_blocks](#input\_public\_cidr\_blocks) | CIDR Blocks for Public Subnets | `list(string)` | `[]` | no |
| <a name="input_root_volume_delete_on_termination"></a> [root\_volume\_delete\_on\_termination](#input\_root\_volume\_delete\_on\_termination) | Whether the volume should be destroyed on instance termination. | `bool` | `true` | no |
| <a name="input_root_volume_ebs_optimized"></a> [root\_volume\_ebs\_optimized](#input\_root\_volume\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized. | `bool` | `false` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size, in GB, of the root EBS volume. | `number` | `50` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | The type of volume. Must be one of: standard, gp2, or io1. | `string` | `"standard"` | no |
| <a name="input_spot_price"></a> [spot\_price](#input\_spot\_price) | The maximum hourly price to pay for EC2 Spot Instances. | `number` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_termination_policies"></a> [termination\_policies](#input\_termination\_policies) | A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default. | `string` | `"Default"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_eip"></a> [bastion\_eip](#output\_bastion\_eip) | n/a |
| <a name="output_bastion_secgrpid"></a> [bastion\_secgrpid](#output\_bastion\_secgrpid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
