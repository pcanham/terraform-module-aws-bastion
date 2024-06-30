output "bastion_eip" {
  value = aws_eip.bastion_ip.[*].public_ip
}

output "bastion_secgrpid" {
  value = aws_security_group.bastion_security_group.[*].id
}
