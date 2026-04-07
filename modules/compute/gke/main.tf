resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  deletion_protection = false
  
  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range
    services_secondary_range_name = var.services_range
  }

  # Release channel (auto upgrades)
  release_channel {
    channel = var.release_channel
  }

  private_cluster_config {
    enable_private_nodes   = true
    master_ipv4_cidr_block = var.master_cidr
  }
}