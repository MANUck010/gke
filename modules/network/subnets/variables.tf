variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    subnet_name          = string
    subnet_ip_cidr_range = string
    region               = string

  }))

  validation {
    condition = alltrue([
      for s in var.subnets :
      length(s.subnet_name) >= 3 && length(s.subnet_name) <= 63
    ])
    error_message = "Each subnet_name must be between 3 and 63 characters."
  }
}

variable "region" {
  description = "The region in which to create the subnetwork."
  type        = string
}

variable "network_id" {
  description = "The ID of the network to which the subnetwork belongs."
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which to create the subnetwork."
  type        = string
}

variable "alias_subnet_name" {
  description = "The name of the subnetwork with private secondary IP range to create."
  type        = string

}


variable "alias_subnet_primary_ip_range" {
  description = "The primary IP CIDR range for the subnetwork with private secondary IP range."
  type        = string

}

variable "subnet_name_alias_ip_range_1" {
  description = "The name of the first secondary IP range for the subnetwork with private secondary IP range."
  type        = string

}

variable "alias_ip_cidr_range_1" {
  description = "The first secondary IP CIDR range for the subnetwork with private secondary IP range."
  type        = string

}

variable "subnet_name_alias_ip_range_2" {
  description = "The name of the second secondary IP range for the subnetwork with private secondary IP range."
  type        = string

}

variable "alias_ip_cidr_range_2" {
  description = "The second secondary IP CIDR range for the subnetwork with private secondary IP range."
  type        = string

}

