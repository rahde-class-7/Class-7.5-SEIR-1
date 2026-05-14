resource "google_compute_instance" "terraform-vm-1" {
  name         = "terraform-vm-1"
  machine_type = "n2d-standard-2"
  zone         = var.zone

  // Network tags for firewall
  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-10-v20260505"
      
    }
  }

  network_interface {
    network = "default"

    // Assigns an public IP
    access_config {
      
    }
  }

   metadata_startup_script = file("/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-9/Deliverables/course-02-security-engineer/111/Startup-scripts/startup.sh")

}

resource "google_compute_instance" "terraform-vm-2" {
  name         = "terraform-vm-2"
  machine_type = "n2d-standard-2"
  zone         = var.zone

  // Network tags for firewall
  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-10-v20260505"
      
    }
  }

  network_interface {
    network = "default"

    // Assigns an public IP
    access_config {
      
    }
  }

   // Boostrapping script
   metadata_startup_script = file("/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-9/Deliverables/course-02-security-engineer/111/Startup-scripts/startup.sh")

}


// Unmanged instance group
resource "google_compute_instance_group" "terraform-vm-umg" {
  name        = "terraform-vm-umg"
  description = "Terraform test unmanaged instance group"

  instances = [
    google_compute_instance.terraform-vm-1.id,
    google_compute_instance.terraform-vm-2.id,
  ]

  zone = var.zone
}