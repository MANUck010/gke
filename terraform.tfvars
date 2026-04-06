network_name            = "test-vpc"
auto_create_subnetworks = false
routing_mode            = "REGIONAL"
project_id              = "do-not-del2"
description             = "This is a test VPC network created by Terraform."
region                  = "us-central1"
subnets = {
  "test-subnet" = {
    subnet_name          = "test-subnet"
    subnet_ip_cidr_range = "10.2.0.0/18"
    region               = "us-central1"
  },
  "test-subnet-2" = {
    subnet_name          = "test-subnet-2"
    subnet_ip_cidr_range = "10.2.64.0/18"
    region               = "us-central1"
  },
  "test-subnet-3" = {
    subnet_name          = "test-subnet-3"
    subnet_ip_cidr_range = "10.2.128.0/19"
    region               = "us-central1"
  }

}
gke_subnet_name = "gke-primary-subnet"            
gke_primary_ip_range = "10.10.0.0/16"
pod_range  = "pod-range"
alias_ip_cidr_range_1         = "10.20.0.0/16"
service_range                 = "service-range"
alias_ip_cidr_range_2         = "10.30.0.0/20"


allow_firewall_rules = {
  "test-fw-rule" = {
    name          = "test-fw-rule"
    direction     = "INGRESS"
    protocol      = "tcp"
    ports         = ["80", "443"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["web-server"]
  },
  "test-fw-rule-2" = {
    name          = "test-fw-rule-2"
    direction     = "EGRESS"
    protocol      = "udp"
    ports         = ["53"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["dns-server"]
  }

}

deny_firewall_rules = {
  "test-fw-rule-3" = {
    name          = "test-fw-rule-3"
    direction     = "INGRESS"
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["ssh-server"]
    priority      = 900
  },
  "test-fw-rule-4" = {
    name          = "test-fw-rule-4"
    direction     = "EGRESS"
    protocol      = "udp"
    ports         = ["123"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["ntp-server"]
    priority      = 900
  }
}


instance_name = "test-instance"
machine_type  = "e2-medium"
zone          = "us-central1-a"
tags          = ["web-server"]
image         = "debian-cloud/debian-11"
labels = {
  "env" = "test"
}

cluster_name = "test-gke-cluster-1"

node_service_account = "gke-node-sa"