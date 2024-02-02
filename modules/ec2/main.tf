resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups
  tags = {
    Name = var.name
  }
}