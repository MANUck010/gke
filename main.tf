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
  gke_subnet_name               = var.gke_subnet_name
  gke_primary_ip_range          = var.gke_primary_ip_range
  pod_range                     = var.pod_range
  alias_ip_cidr_range_1         = var.alias_ip_cidr_range_1
  service_range                 = var.service_range
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

# module "compute_instance" {
#   source = "./modules/compute/compute_instance"

#   project_id    = var.project_id
#   instance_name = var.instance_name
#   machine_type  = var.machine_type
#   zone          = var.zone
#   tags          = var.tags
#   image         = var.image
#   network_id    = module.vpc.vpc_id
#   subnetwork_id = module.subnets.subnets["test-subnet"].self_link
#   labels        = var.labels
# }

###################################################
### GKE Cluster configuration####################
###################################################

module "gke" {
  source = "./modules/compute/gke"

  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name  

  network    = module.vpc.vpc_name
  subnetwork = module.subnets.subnet_name

  min_node_count = var.min_node_count
  max_node_count = var.max_node_count

  labels = var.labels
  tags   = var.tags

  pods_range     = module.subnets.pods_range_name
  services_range = module.subnets.services_range_name

  release_channel = var.release_channel

  master_cidr = "172.16.0.0/28"

  node_service_account = var.node_service_account

}


