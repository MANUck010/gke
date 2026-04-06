
variable "network_id" {
  description = "The ID of the network to which the firewall rule belongs."
  type        = string

}

variable "allow_firewall_rules" {
  description = "Map of firewall rules"
  type = map(object({
    name          = string
    direction     = string # INGRESS or EGRESS
    priority      = optional(number, 1000)
    protocol      = string
    ports         = list(string)
    source_ranges = optional(list(string), [])
    target_tags   = optional(list(string), [])
  }))
}


variable "deny_firewall_rules" {
  description = "Map of firewall rules"
  type = map(object({
    name          = string
    direction     = string # INGRESS or EGRESS
    priority      = optional(number, 1000)
    protocol      = string
    ports         = list(string)
    source_ranges = optional(list(string), [])
    target_tags   = optional(list(string), [])
  }))

  validation {
    condition = alltrue([
      for r in var.deny_firewall_rules :
      r.priority < 1000
    ])
    error_message = "Deny rules should have higher priority (lower number) than allow rules."
  }
}

