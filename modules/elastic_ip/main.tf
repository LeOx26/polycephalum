resource "aws_eip" "this" {
  instance = var.intance_id
  domain = var.domain
}