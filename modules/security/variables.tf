variable "name" {
  description = "Nombre del grupo de seguridad"
  type = string
}

variable "vpc_id" {
  description = "ID de la vpc"
  type = string
}

variable "description" {
  description = "Descripcion del grupo de seguridad"
  type = string
}

variable "ingress_from_port" {
  description = "From port"
  type = number
}

variable "ingress_to_port" {
  description = "To port"
  type = number
}

variable "ingress_protocol" {
  description = "Protocolo del puerto"
  type = string
}

variable "egress_from_port" {
  description = "From port"
  type = number
}

variable "egress_to_port" {
  description = "To port"
  type = number
}

variable "egress_protocol" {
  description = "Protocolo del puerto"
  type = string
}