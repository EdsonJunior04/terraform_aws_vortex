provider "aws" {
  region = var.region_aws1
}


module "network" {
  source = "./modules/vpc"
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_public = module.network.subnet_public
  sg_vortex     = module.network.sg_vortex
}
