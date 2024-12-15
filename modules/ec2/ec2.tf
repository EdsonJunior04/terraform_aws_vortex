provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami                         = var.ami_ec2
  instance_type               = "t2.medium"
  subnet_id                   = var.subnet_public
  security_groups             = [var.sg_vortex]
  associate_public_ip_address = true
  key_name                    = "vortex"

  user_data = var.script_docker_grafana_influxdb

  tags = {
    Name = var.nome_ec2
  }

}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "dns_public" {
  value = aws_instance.ec2.public_dns
}