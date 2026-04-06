output "vpc_id" {
  description = "The ID of the VPC network."
  value       = google_compute_network.network.id

}

output "vpc_name" {
  description = "The name of the VPC network."
  value       = google_compute_network.network.name

}