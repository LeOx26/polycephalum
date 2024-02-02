variable "name" {
  description = "Nombre de la instancia"
  type = string
}

variable "ami" {
  description = "AMI de la instancia"
  type = string
}

variable "type" {
  description = "Tipo de instancia"
  type = string
}

variable "subnet_id" {
  description = "Id de la subnet"
  type = string
}

variable "security_groups" {
  description = "Grupos de seguridad"
  type = list(string)
}