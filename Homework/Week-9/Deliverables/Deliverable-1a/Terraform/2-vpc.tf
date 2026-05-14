resource "google_compute_network" "dev-vpc-network" {
  project                 = var.project_id
  name                    = "dev-vpc-network"
  auto_create_subnetworks = false
}

# creating 1st subnet
resource "google_compute_subnetwork" "dev-subnet-1" {
  name          = "dev-subnet-1"
  ip_cidr_range = "10.1.0.0/16"
  region        = var.region
  network       = google_compute_network.dev-vpc-network.id
}

# creating 2nd subnet
resource "google_compute_subnetwork" "dev-subnet-2" {
  name          = "dev-subnet-2"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.dev-vpc-network.id
}

# creating 3rd subnet
resource "google_compute_subnetwork" "dev-subnet-3" {
  name          = "dev-subnet-3"
  ip_cidr_range = "10.3.0.0/16"
  region        = var.region
  network       = google_compute_network.dev-vpc-network.id
}




