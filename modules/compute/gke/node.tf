resource "google_container_node_pool" "nodes" {
  name     = "${var.cluster_name}-nodes"
  cluster  = google_container_cluster.primary.name
  location = var.region
  project  = var.project_id

  node_count = var.node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  
  node_config {
    machine_type    = var.machine_type
    service_account = google_service_account.gke_nodes.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = var.gke_labels
    tags   = var.gke_tags
  }
}