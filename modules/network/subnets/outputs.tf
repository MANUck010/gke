output "subnets" {
  description = "All subnet details"
  value = {
    for k, subnet in google_compute_subnetwork.subnet-1 :
    k => {
      name          = subnet.name
      self_link     = subnet.self_link
      ip_cidr_range = subnet.ip_cidr_range
      region        = subnet.region
    }
  }
}

output "subnet_name" {
  value = google_compute_subnetwork.gke-subnet.name
}

output "subnet_self_link" {
  value = google_compute_subnetwork.gke-subnet.self_link
}

output "pods_range_name" {
  value = var.pod_range
}

output "services_range_name" {
  value = var.service_range
}