variable "instance_name" {
  description = "gce instance name"
  type        = string
}

variable "machine_type" {
  description = "gce instance machine type"
  type        = string
}

variable "zone" {
  description = "gce instance zone"
  type        = string
}

variable "project_id" {
  description = "gce instance project id"
  type        = string
}

variable "image" {
  description = "gce instance image"
  type        = string
}


variable "tags" {
  description = "gce instance tag"
  type        = list(string)

}
variable "network_id" {
  description = "gce instance network id"
  type        = string
}

variable "subnetwork_id" {
  description = "gce instance subnetwork id"
  type        = string
}

variable "labels" {
  description = "gce instance labels"
  type        = map(string)
}
