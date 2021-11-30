provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Project = var.project_name
      Owner   = var.owner
    }
  }
}

module "vpc" {
  source = "./tf-modules/vpc"

  name_prefix = var.name_prefix

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "key_pair" {
  source = "./tf-modules/keypair"

  name_prefix = var.name_prefix
}

module "gitlab_host_instance" {
  source = "./tf-modules/ec2"

  name_prefix = var.name_prefix

  instance_type = var.host_instance_type
  key_name      = module.key_pair.key_name
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  private_ip    = var.host_private_ip
  attach_eip    = true

}

module "gitlab_runner_instance" {
  source = "./tf-modules/ec2"

  name_prefix = var.name_prefix

  instance_type = var.runner_instance_type
  key_name      = module.key_pair.key_name
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  private_ip    = var.host_private_ip
  attach_eip    = true

}
