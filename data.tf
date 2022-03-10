data "aws_instance" "bastion" {
  filter {
    name   = "tag:Name"
    values = ["${var.bastion_name}"]
  }

  depends_on = [
    module.bastion
  ]
}