variable "ami_ec2" {
  default = "ami-0e2c8caa4b6378d8c"
}

variable "subnet_public" {
  type = string
}

variable "sg_vortex" {
  type = string
}

variable "nome_ec2" {
  default = "Grafana_Influxdb"
}

variable "script_docker_grafana_influxdb" {
  default = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -a -G docker root
sudo usermod -a -G docker ubuntu
sudo docker pull from grafana/grafana:latest
sudo docker run -d --name=grafana -p 3000:3000 grafana/grafana
sudo docker pull influxdb
sudo docker run -d -p 8086:8086 -v "$PWD/data:/var/lib/influxdb2" -v "$PWD/config:/etc/influxdb2" -e DOCKER_INFLUXDB_INIT_MODE=setup -e DOCKER_INFLUXDB_INIT_USERNAME=admin -e DOCKER_INFLUXDB_INIT_PASSWORD=Senai@134 -e DOCKER_INFLUXDB_INIT_ORG=senai -e DOCKER_INFLUXDB_INIT_BUCKET=senai influxdb:2
EOF
}