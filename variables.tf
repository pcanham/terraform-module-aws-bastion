variable "create_bastion" {
  type        = bool
  description = "Boolean create bastion true or false"
  default     = true
}

variable "custom_suffix" {
  type        = string
  description = "enter a suffix which will be tagged to all created objects, if not set a random one will be assigned"
  nullable    = true
  default     = null
}

variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
  default     = ""
}

variable "termination_policies" {
  type        = string
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default."
  default     = "Default"
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

variable "spot_price" {
  type        = number
  description = "The maximum hourly price to pay for EC2 Spot Instances."
  nullable    = true
  default     = null
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

variable "bastion_os" {
  type        = string
  description = "Which operating system do you want (options: nix, win):"
  default     = "nix"
  validation {
    condition     = contains(["nix", "win"], lower(var.bastion_os))
    error_message = "Unsupported bastion_os type needs to be: \"nix\", \"win\"!"
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
  default     = {}
}
