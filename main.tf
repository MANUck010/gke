/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source                  = "./modules/network/vpc"
  network_name            = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project_id              = var.project_id
  description             = var.description

}

/******************************************
	Subnet configuration
 *****************************************/
module "subnets" {
  source                        = "./modules/network/subnets"
  project_id                    = var.project_id
  network_id                    = module.vpc.vpc_id
  subnets                       = var.subnets
  region                        = var.region
  alias_subnet_name             = var.alias_subnet_name
  alias_subnet_primary_ip_range = var.alias_subnet_primary_ip_range
  subnet_name_alias_ip_range_1  = var.subnet_name_alias_ip_range_1
  alias_ip_cidr_range_1         = var.alias_ip_cidr_range_1
  subnet_name_alias_ip_range_2  = var.subnet_name_alias_ip_range_2
  alias_ip_cidr_range_2         = var.alias_ip_cidr_range_2
}

/******************************************
	Firewall rules
 *****************************************/

module "firewall_rules" {
  source = "./modules/network/firewall-rules"

  allow_firewall_rules = var.allow_firewall_rules
  network_id           = module.vpc.vpc_id
  deny_firewall_rules  = var.deny_firewall_rules

}



#############
# Instances
#############

module "compute_instance" {
  source = "./modules/compute/compute_instance"

  project_id    = var.project_id
  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  tags          = var.tags
  image         = var.image
  network_id    = module.vpc.vpc_id
  subnetwork_id = module.subnets.subnets["test-subnet"].self_link
  labels        = var.labels
}


