variable "name" {
  description = "Nombre la tabla de rutas"
  type = string
}

variable "vpc_id" {
  description = "ID de la vpc"
  type = string
}

variable "cidr_block" {
  description = "Cird de la tabla de rutas"
  type = string
}

variable "internet_gateway_id" {
  description = "ID del internet gateway"
  type = string
}