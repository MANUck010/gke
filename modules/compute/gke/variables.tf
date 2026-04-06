variable "cluster_name" {
  description = "The name of the GKE cluster to create."
  type        = string
}

variable "region" {
  description = "The region in which to create the GKE cluster."
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which to create the GKE cluster."
  type        = string
}

variable "network" {
  description = "The name of the network to which the GKE cluster belongs."
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork to which the GKE cluster belongs."
  type        = string
}

variable "pods_range" {
  description = "The name of the secondary IP range for pods in the GKE cluster."
  type        = string
}

variable "services_range" {
  description = "The name of the secondary IP range for services in the GKE cluster."
  type        = string
}

variable "master_cidr" {
  description = "The CIDR block for the master IP address in the GKE cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes to create in the GKE cluster."
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "The machine type to use for the nodes in the GKE cluster."
  type        = string
  default     = "e2-medium"
}

variable "node_service_account" {
  description = "The service account to use for the nodes in the GKE cluster."
  type        = string
  default     = null    

}