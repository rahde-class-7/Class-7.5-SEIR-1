
# resource "google_compute_address" "static-ip-address" {
#   name = "static-ip-address"
# }
resource "google_compute_instance" "dev-instance" {
  name = "dev-instance"
  
  # non-required attribute
  description  = ""
  zone         = var.zone
  machine_type = "n2d-standard-2"
  tags         = ["http-server"]
  boot_disk {
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-10-v20260505"
      size  = 100
    }
  }
  # non-required attribute
  attached_disk {
    source = google_compute_disk.additional-disk.self_link
  }

  network_interface {
    network = "default"
  }

  # network_interface {
  #   network = "default"
  #   subnetwork = data.google_compute_subnetwork.kubernetes.id
  #   access_config {
  #     nat_ip = google_compute_address.static-ip-address.address
  #   }
  # }

  metadata_startup_script = file("/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-8/Deliverables/Deliverable-1a/Startup-scripts/startup.sh")

}

resource "google_compute_disk" "additional-disk" {
  name  = "additional-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "debian-11-bullseye-v20220719"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}