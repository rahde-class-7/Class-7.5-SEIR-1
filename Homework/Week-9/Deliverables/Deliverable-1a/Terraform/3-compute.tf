// Create an instance template to be using in an managed instance group
resource "google_compute_instance_template" "server-template" {
  name        = "server-template"
  region           = var.region
  description = "This template is used to create server instances."

  machine_type         = "e2-medium"

  // Create a new boot disk from an image
  disk {
    source_image      = "projects/centos-cloud/global/images/centos-stream-10-v20260505"
  }

  network_interface {
    network = "default"
  }

  // Points to location of bootstrapping script
  metadata_startup_script = file("/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-9/Deliverables/Deliverable-1a/Startup-scripts/startup.sh")

  // Used by firewall rules to apply rules to instances
  tags = [ "http-server"]

}

// Health check for MIG
resource "google_compute_health_check" "server-template-tcp-health-check" {
  name = "server-template-tcp-health-check"

  check_interval_sec  = 10
  timeout_sec         = 3
  healthy_threshold   = 3
  unhealthy_threshold = 3 # 50 seconds

  tcp_health_check {
    port = "80"
  }
}

// Create managed instance group
resource "google_compute_instance_group_manager" "server-mig" {
  name = "server-mig"

  base_instance_name = "server"
  zone               = var.zone

  version {
    instance_template  = google_compute_instance_template.server-template.self_link_unique
  }

  // Health check configuration for managed instance group
  auto_healing_policies {
    health_check      = google_compute_health_check.server-template-tcp-health-check.id
    initial_delay_sec = 300
  }
}

// Autoscaling configuration for MIG
resource "google_compute_autoscaler" "server-autoscaler" {
  name   = "server-autoscaler"
  zone   = "us-central1-a"
  target = google_compute_instance_group_manager.server-mig.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}