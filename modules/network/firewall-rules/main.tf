/******************************************
	Firewall rules configuration
 *****************************************/
resource "google_compute_firewall" "allow_rules" {
  for_each = var.allow_firewall_rules

  name      = each.value.name
  network   = var.network_id
  direction = each.value.direction
  priority  = each.value.priority

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }



  source_ranges = each.value.direction == "INGRESS" ? each.value.source_ranges : null
  target_tags   = each.value.target_tags
}


resource "google_compute_firewall" "deny_rules" {
  for_each = var.deny_firewall_rules

  name      = each.value.name
  network   = var.network_id
  direction = each.value.direction
  priority  = each.value.priority

  deny {
    protocol = each.value.protocol
    ports    = each.value.ports
  }
  source_ranges = each.value.direction == "INGRESS" ? each.value.source_ranges : null
  target_tags   = each.value.target_tags
}