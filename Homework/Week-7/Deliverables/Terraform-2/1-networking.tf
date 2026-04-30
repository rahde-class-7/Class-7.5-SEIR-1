resource "google_compute_network" "vpc_network" {
  project                                   = "class-seven-point"
  name                                      = "vpc-network"
  auto_create_subnetworks                   = false
}

resource "google_compute_subnetwork" "subnetwork-purpose-private-nat" {
  name             = "subnet-purpose-test-subnetwork"
  region           = "us-east4"
  ip_cidr_range    = "192.168.1.0/24"
  network          = google_compute_network.vpc_network.id
}