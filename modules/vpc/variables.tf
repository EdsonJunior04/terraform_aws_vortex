variable "nome_vpc" {
  default     = "vortexti"
  description = "Nome da VPC"
}

variable "regiao" {
  default = "us-east-1"
}

variable "endereco_vpc" {
  default = "192.168.0.0/16"
}

variable "nome_subnete_publica" {
  default = "publica"
}

variable "endereco_subnet_publica" {
  default = "192.168.0.0/24"
}

variable "nome_subnet_privada" {
  default = "privada"
}

variable "endereco_subnet_privada" {
  default = "192.168.1.0/24"
}

variable "nome_gateway" {
  default = "gateway_vortex"
}

variable "nome_tabela_rotas" {
  default = "tabela_rotas_vortex"
}

variable "nome_sg" {
  default = "sg_vortex"
}

variable "description_sg" {
  default = "Grupo de seguranca da vortex"
}
