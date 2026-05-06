# CREATE COMPUTE ENGINE
resource "google_compute_instance" "dev-instance" {
  name             = "dev-instance"
  zone             = var.zone
  machine_type     = "n2d-standard-2"

  boot_disk {
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-10-v20260505"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"
  }
}