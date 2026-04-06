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
