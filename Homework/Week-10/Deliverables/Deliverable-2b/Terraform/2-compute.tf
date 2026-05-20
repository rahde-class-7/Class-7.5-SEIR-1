# CREATE COMPUTE ENGINE
resource "google_compute_instance" "confidential_instance" {
  name             = "my-confidential-instance"
  zone             = "us-central1-a"
  machine_type     = "n2d-standard-2"
  min_cpu_platform = "AMD Milan"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

  }
}