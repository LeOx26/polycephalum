variable "name" {
  description = "Nombre de la subnet"
  type = string
}

variable "cidr_block" {
  description = "Cidr de la subnet"
  type =  string
}

variable "map_public" {
  description = "Nivel de la subnet"
  type = string
}

variable "vpc_id" {
  description = "ID de la vpc"
  type = string
}
