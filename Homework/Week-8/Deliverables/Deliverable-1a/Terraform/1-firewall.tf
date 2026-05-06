# CREATING AN FIREWALL RULE
#resource "google_compute_firewall" "allow-http" {
 # name    = "allow-http"
 # network = google_compute_network.default.name

 # allow {
 #   protocol = "tcp"
 #   ports    = ["80"]
 # }

 # source_tags = ["web"]
#}

#resource "google_compute_network" "default" {
#  name = "test-network"
#}