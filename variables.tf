variable "network_name" {
  description = "The name of the network to create."
  type        = string

}

variable "auto_create_subnetworks" {
  description = "Whether to automatically create subnetworks in all regions. If set to true, this network will have subnetworks created in each region automatically. If set to false, this network will not have subnetworks created automatically and you will need to create subnetworks manually."
  type        = bool
}

variable "routing_mode" {
  description = "The network routing mode to use. If set to REGIONAL, this network will use regional dynamic routing. If set to GLOBAL, this network will use global dynamic routing."
  type        = string
  default     = "REGIONAL"
}

variable "project_id" {
  description = "The ID of the project in which to create the network."
  type        = string
}

variable "description" {
  description = "An optional description of this resource."
  type        = string
  default     = null
}



variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    subnet_name          = string
    subnet_ip_cidr_range = string
    region               = string

  }))
}

variable "region" {
  description = "The region in which to create the subnetwork."
  type        = string

}

variable "alias_subnet_name" {
  description = "The name of the subnetwork with private secondary IP range to create."
  type        = string
}

variable "gke_subnet_name" {
  description = "The name of the GKE subnetwork with private secondary IP range to create."
  type        = string

}


variable "gke_primary_ip_range" {
  description = "The primary IP CIDR range for the GKE subnetwork with private secondary IP range."
  type        = string

}

variable "pod_range" {
  description = "The name of the first secondary IP range for the GKE subnetwork with private secondary IP range."
  type        = string

}

variable "alias_ip_cidr_range_1" {
  description = "The first secondary IP CIDR range for the subnetwork with private secondary IP range."
  type        = string

}

variable "service_range" {
  description = "The name of the second secondary IP range for the GKE subnetwork with private secondary IP range."
  type        = string

}

variable "alias_ip_cidr_range_2" {
  description = "The second secondary IP CIDR range for the subnetwork with private secondary IP range."
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


}



variable "image" {
  description = "The image to use for the compute instance."
  type        = string
}

variable "zone" {
  description = "The zone in which to create the compute instance."
  type        = string
}

variable "tags" {
  description = "The tags to apply to the compute instance."
  type        = list(string)
}

variable "instance_name" {
  description = "The name of the compute instance to create."
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the compute instance."
  type        = string
}

variable "labels" {
  description = "The labels to apply to the compute instance."
  type        = map(string)
}


variable "cluster_name" {
  description = "The name of the GKE cluster to create."
  type        = string
}

variable "node_service_account" {
  description = "The service account to use for the nodes in the GKE cluster."
  type        = string
  default     = null
  
}
