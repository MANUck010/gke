terraform {
  backend "gcs" {
    bucket      = "tf-state-buk"
    prefix      = "test/state/gke"
    
  }
}