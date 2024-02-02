# Parametros para el despligue se encuentran el archivo terraform.tfvars
# exportar las credenciales de aws como variables de entorno

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  cidr = var.cidr_block
  name = var.vpc_name
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.id
  for_each = var.subnets
  name = each.value.name
  map_public = each.value.map_public
  cidr_block = each.value.cidr_block
}

module "secutiry_group" {
  source = "./modules/security"
  for_each = var.secutiry_group
  name = each.value.name
  description = each.value.description
  vpc_id = module.vpc.id
  ingress_from_port = each.value.ingress_from_port
  ingress_to_port = each.value.ingress_to_port
  ingress_protocol = each.value.ingress_protocol
  egress_from_port = each.value.egress_from_port
  egress_to_port = each.value.egress_to_port
  egress_protocol = each.value.egress_protocol

}

module "route_table_private" {
  source = "./modules/route_table"
  name = "private"
  vpc_id = module.vpc.id
  cidr_block = var.cidr_block_route_table_private
  internet_gateway_id = var.gateway_id
}

module "route_table_public" {
  source = "./modules/route_table"
  name = "public"
  vpc_id = module.vpc.id
  cidr_block = var.cidr_block_route_table_public
  internet_gateway_id = module.internet_gateway.id
}

module "route_table_association_private" {
  source = "./modules/route_table_association"
  subnet_id = module.subnet["privada"].id
  route_table_id = module.route_table_private.id
}

module "route_table_association_public" {
  source = "./modules/route_table_association"
  subnet_id = module.subnet["publica"].id
  route_table_id = module.route_table_public.id
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.id
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.instance_ami
  type = var.instance_type
  name = var.instance_name
  subnet_id = module.subnet["privada"].id
  security_groups = [module.secutiry_group["ssh"].id, module.secutiry_group["web"].id]
}

module "eip" {
  source = "./modules/elastic_ip"
  intance_id = module.ec2.id
  domain = var.domain
}