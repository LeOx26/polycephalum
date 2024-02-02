variable "region" {
  description = "Region de aws"
  type = string
}

variable "vpc_name" {
  description = "Nombre de la vpc"
  type = string
}

variable "cidr_block" {
  description = "Cidr block vpc"
  type = string
}

variable "subnets" {
  description = "Mapa de atributos de las subnets"
  type = map(object({
    name = string
    map_public = string
    cidr_block = string
  }))
}

variable "gateway_id" {
  description = "ID gateway"
  type = string
}

variable "cidr_block_route_table_private" {
  description = "Cidr de la tabla de rutas"
  type = string
}

variable "cidr_block_route_table_public" {
  description = "Cidr de la tabla de rutas"
  type = string
}

variable "secutiry_group" {
  description = "Mapa de atributos para los grupo de seguridad"
  type = map(object({
    name = string
    description = string
    ingress_from_port = number
    ingress_to_port = number
    ingress_protocol = string
    egress_from_port = number
    egress_to_port = number
    egress_protocol = string
  }))
}

variable "instance_name" {
  description = "Nombre de la instancia"
  type = string
}

variable "instance_ami" {
  description = "AMI de la instancia"
  type = string
}

variable "instance_type" {
  description = "Tipo de instancia"
  type = string
}

variable "domain" {
  description = "Dominio"
  type = string
}