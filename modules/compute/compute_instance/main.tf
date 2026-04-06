/******************************************
	Compute instance configuration
 *****************************************/

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  project      = var.project_id
  zone         = var.zone

  tags = var.tags

  labels = var.labels

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnetwork_id
  }

}