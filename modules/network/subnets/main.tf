/******************************************
	Subnetconfiguration
 *****************************************/
resource "google_compute_subnetwork" "subnet-1" {
  for_each      = var.subnets
  name          = each.value.subnet_name
  ip_cidr_range = each.value.subnet_ip_cidr_range
  region        = each.value.region
  network       = var.network_id
  project       = var.project_id

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}


resource "google_compute_subnetwork" "network-with-private-secondary-ip-range" {
  name          = var.alias_subnet_name
  region        = var.region
  network       = var.network_id
  project       = var.project_id
  ip_cidr_range = var.alias_subnet_primary_ip_range

  secondary_ip_range {
    range_name    = var.subnet_name_alias_ip_range_1
    ip_cidr_range = var.alias_ip_cidr_range_1
  }

  secondary_ip_range {
    range_name    = var.subnet_name_alias_ip_range_2
    ip_cidr_range = var.alias_ip_cidr_range_2
  }
}