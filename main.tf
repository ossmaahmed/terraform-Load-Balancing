
module "hellow" {
  source = "./module/network"

  cidr           = var.cidr_vpc
  tag            = var.tag_vpc
  subnet_public  = var.public_sub_env
  private_subnet = var.private_sub_env
  tag_public     = var.tags_of_public
  zone           = var.zones_of_sub
  tag_private    = var.tags_of_private
}
module "ec2_public" {
  source = "./module/ec2"

  ami_id          = var.ami_is
  zone_of_ec2     = var.zones_of_sub
  subnet_id_ec2   = module.hellow.public_subnet_id
  instance_type   = var.instance_type_is
  security_groups = module.hellow.sg_web
  tags_of_ec2     = var.tags_of_public
}

module "ec2_private" {
  source          = "./module/ec2"
  ami_id          = var.ami_is
  zone_of_ec2     = var.zones_of_sub
  subnet_id_ec2   = module.hellow.private_subnet_id
  instance_type   = var.instance_type_is
  security_groups = module.hellow.private_security_group
  tags_of_ec2     = var.tags_of_private
}

module "Web_load_balancer" {
  source = "./module/elb"

  name_prefix        = "web"
  internal           = false
  subnets_of_vpc     = module.hellow.public_subnet_id
  security_groups    = module.hellow.sg_web
  vpc_id             = module.hellow.vpc_id
  type_of_lb         = var.type
  target_of_instance = module.ec2_public.ec2
}

module "private_load_balancer" {
  source = "./module/elb"

  name_prefix        = "private"
  internal           = true
  subnets_of_vpc     = module.hellow.private_subnet_id
  security_groups    = module.hellow.private_security_group
  vpc_id             = module.hellow.vpc_id
  type_of_lb         = var.type
  target_of_instance = module.ec2_private.ec2
}