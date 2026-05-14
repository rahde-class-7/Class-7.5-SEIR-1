# Resource: Reserve Regional Static IP Address
resource "google_compute_address" "mylb" {
  name   = "mylb-regional-static-ip"
  region = var.region
}

# Load Balancer health check
resource "google_compute_http_health_check" "lb_health_check" {
  name               = "lb-health-check"
  check_interval_sec = 1
  timeout_sec        = 1
  healthy_threshold  = 1
  unhealthy_threshold = 2
  port               = 80
  request_path       = "/healthz"
}

# forwarding rule
resource "google_compute_forwarding_rule" "lb_frontend" {
  name                  = "lb-frontend"
  target                = google_compute_target_pool.lb_target_pool.self_link
  port_range            = "80"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_pool" "lb_target_pool" {
  name = "lb-target-pool"

  health_checks = [google_compute_http_health_check.lb_health_check.self_link]
}

resource "google_compute_firewall" "lb_firewall" {
  name    = "lb-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}