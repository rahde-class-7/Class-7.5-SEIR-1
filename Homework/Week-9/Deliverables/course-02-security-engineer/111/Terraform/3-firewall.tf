resource "google_compute_firewall" "terraform-vm-firewall" {
  project     = var.project-id
  name        = "terraform-vm-firewall"
  network     = "default"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["80", "20"]
  }

  source_ranges = ["0.0.0.0/0"]
  
  //allows firewall to be applied to vm
  target_tags = ["http-server"]
}