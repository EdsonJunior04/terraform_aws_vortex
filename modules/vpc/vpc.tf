resource "aws_vpc" "vpc_vortex" {
  cidr_block = var.endereco_vpc

  tags = {
    Name = var.nome_vpc
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.vpc_vortex.id
  cidr_block = var.endereco_subnet_publica

  tags = {
    Name = var.nome_subnete_publica
  }
}

resource "aws_subnet" "subnet_privada" {
  vpc_id     = aws_vpc.vpc_vortex.id
  cidr_block = var.endereco_subnet_privada

  tags = {
    Name = var.nome_subnet_privada
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_vortex.id


  tags = {
    Name = var.nome_gateway
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_vortex.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.nome_tabela_rotas
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "grupo_seguranca_vortex" {
  name        = var.nome_sg
  description = var.nome_sg
  vpc_id      = aws_vpc.vpc_vortex.id



  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8086
    to_port     = 8086
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = var.nome_sg
  }
}

