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
alias_subnet_name             = "test-subnet-alias"
alias_subnet_primary_ip_range = "10.2.248.0/22"
subnet_name_alias_ip_range_1  = "test-subnet-alias-ip-range-1"
alias_ip_cidr_range_1         = "10.2.252.0/23"
subnet_name_alias_ip_range_2  = "test-subnet-alias-ip-range-2"
alias_ip_cidr_range_2         = "10.2.254.0/23"


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