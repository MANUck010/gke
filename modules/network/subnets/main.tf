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


resource "google_compute_subnetwork" "gke-subnet" {
  name          = var.gke_subnet_name
  region        = var.region
  network       = var.network_id
  project       = var.project_id
  ip_cidr_range = var.gke_primary_ip_range

  secondary_ip_range {
    range_name    = var.pod_range
    ip_cidr_range = var.alias_ip_cidr_range_1
  }

  secondary_ip_range {
    range_name    = var.service_range
    ip_cidr_range = var.alias_ip_cidr_range_2
  }
}