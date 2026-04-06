resource "google_service_account" "gke_nodes" {
  account_id   = var.node_service_account
  display_name = "GKE Node Service Account"
  project      = var.project_id
}