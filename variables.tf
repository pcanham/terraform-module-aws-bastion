variable "create_bastion" {
  type        = bool
  description = "Boolean create bastion true or false"
  default     = ""
}

variable "environment_tag" {
  type        = string
  description = "Define the type of environment"
  default     = ""
}

variable "owner_tag" {
  type        = string
  description = "Identifies the role that is responsible for the service"
  default     = ""
}

variable "project_tag" {
  type        = string
  description = "Project code name or name, e.g. WMP-ECOMM, ANZ-GO"
  default     = ""
}

variable "cost_center_tag" {
  type        = string
  description = "Budget code for responsible for the service"
  default     = ""
}

variable "business_tag" {
  type        = string
  description = "Business Stream that requires instance(s) e.g. ELT, Academic, Education, Infrastructure, Legal, etc"
  default     = ""
}

variable "automation_tag" {
  type        = string
  description = "Tag to highlight services/components have been created with an automation tool"
  default     = "Created with Terraform"
}

variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
  default     = ""
}

variable "availability_zones" {
  type        = list(string)
  description = "AWS region to launch servers."
  default     = []
}

variable "termination_policies" {
  type        = string
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default."
  default     = "Default"
}

variable "tenancy" {
  type        = string
  description = "The tenancy of the instance. Must be one of: default or dedicated."
  default     = "default"
}

variable "root_volume_ebs_optimized" {
  type        = bool
  description = "If true, the launched EC2 instance will be EBS-optimized."
  default     = false
}

variable "root_volume_type" {
  type        = string
  description = "The type of volume. Must be one of: standard, gp2, or io1."
  default     = "standard"
}

variable "root_volume_size" {
  type        = number
  description = "The size, in GB, of the root EBS volume."
  default     = 50
}

variable "root_volume_delete_on_termination" {
  type        = bool
  description = "Whether the volume should be destroyed on instance termination."
  default     = true
}

variable "instance_profile_path" {
  type        = string
  description = "Path in which to create the IAM instance profile."
  default     = "/"
}

variable "spot_price" {
  type        = number
  description = "The maximum hourly price to pay for EC2 Spot Instances."
  default     = ""
}

variable "ami_id" {
  type        = string
  description = "The ID of the AMI to run in the cluster."
  default     = ""
}

variable "ssh_key_name" {
  type        = string
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair."
  default     = ""
}

variable "user_data" {
  type        = string
  description = "A User Data script to execute while the server is booting. We remmend passing in a bash script that executes the run-consul script, which should have been installed in the Consul AMI by the install-consul module."
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "If set to true, associate a public IP address with each EC2 Instance in the cluster."
  default     = true
}

variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
  default     = ""
}

variable "public_cidr_blocks" {
  type        = list(string)
  description = "CIDR Blocks for Public Subnets"
  default     = []
}

variable "cidr_whitelist" {
  type        = list(string)
  description = "CIDR Whitelist"
  default     = ["0.0.0.0/0"]
}

## going to be used for Windows or Linux Bastion selection.
variable "bastion_os_list" {
  type        = list(string)
  description = "Operating System List"
  default     = ["win", "nix"]
}

variable "bastion_os" {
  type        = string
  description = "Which operating system do you want (options: nix, win):"
  default     = "nix"
}
