## Util
Applications used within this repo to help with CHANGELOG creation and also checking files within the repo

- [git-chglog](https://github.com/git-chglog/git-chglog)
- [semtag](https://github.com/pnikosis/semtag)
- [pre-commit](https://pre-commit.com/)

## Terraform Inputs and Outputs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id | The ID of the AMI to run in the cluster. | string | `""` | no |
| associate\_public\_ip\_address | If set to true, associate a public IP address with each EC2 Instance in the cluster. | string | `"true"` | no |
| automation\_tag | Tag to highlight services/components have been created with an automation tool | string | `"Created with Terraform"` | no |
| availability\_zones | AWS region to launch servers. | list | `[]` | no |
| aws\_region | AWS region to launch servers. | string | `""` | no |
| bastion\_os | Which operating system do you want (options: nix, win): | string | `"nix"` | no |
| bastion\_os\_list | Operating System List | list | `[ "win", "nix" ]` | no |
| business\_tag | Business Stream that requires instance(s) e.g. Infrastructure, Legal, etc | string | `""` | no |
| cidr\_whitelist | CIDR Whitelist | list | `[ "0.0.0.0/0" ]` | no |
| cost\_center\_tag | Budget code for responsible for the service | string | `""` | no |
| create\_bastion | Boolean create bastion true or false | string | `""` | no |
| environment\_tag | Define the type of environment | string | `""` | no |
| instance\_profile\_path | Path in which to create the IAM instance profile. | string | `"/"` | no |
| instance\_type | EC2 instance type | string | `"t3.micro"` | no |
| owner\_tag | Identifies the role that is responsible for the service | string | `""` | no |
| project\_tag | Project code name or name | string | `""` | no |
| public\_cidr\_blocks | CIDR Blocks for Public Subnets | list | `[]` | no |
| root\_volume\_delete\_on\_termination | Whether the volume should be destroyed on instance termination. | string | `"true"` | no |
| root\_volume\_ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized. | string | `"false"` | no |
| root\_volume\_size | The size, in GB, of the root EBS volume. | string | `"50"` | no |
| root\_volume\_type | The type of volume. Must be one of: standard, gp2, or io1. | string | `"standard"` | no |
| ssh\_key\_name | The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair. | string | `""` | no |
| tenancy | The tenancy of the instance. Must be one of: default or dedicated. | string | `"default"` | no |
| termination\_policies | A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default. | string | `"Default"` | no |
| user\_data | A User Data script to execute while the server is booting. | string | `""` | no |
| vpc\_id | AWS VPC ID | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_eip |  |
| bastion\_secgrpid |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->