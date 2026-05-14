# Firewall for MIG
resource "google_compute_firewall" "terraform-firewall-rule" {
  project     = var.project_id
  name        = "terraform-firewall-rule"
  network     = "default"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
}