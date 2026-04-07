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

variable "release_channel" {
  description = "The release channel to use for the GKE cluster (e.g., 'REGULAR', 'RAPID', 'STABLE')."
  type        = string
  default     = "REGULAR"
  
}

variable "min_node_count" {
  description = "The minimum number of nodes for autoscaling in the GKE cluster."
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "The maximum number of nodes for autoscaling in the GKE cluster."
  type        = number
  default     = 3
}

variable "gke_labels" {
  description = "values to apply to the nodes in the GKE cluster as labels."
  type    = map(string)
  default = {}
}

variable "gke_tags" {
  description = "values to apply to the nodes in the GKE cluster as tags."
  type    = list(string)
  default = []
}