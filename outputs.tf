output "bastion_public_ip" {
  value = data.aws_instance.bastion.public_ip
}

output "bastion_dns" {
  value = data.aws_instance.bastion.public_dns
}