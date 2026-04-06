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