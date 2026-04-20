#The GCS backend bucket must be created first, 
#before terraform init, because Terraform cannot use a backend that does not already exist.

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "class7point5-prod-tfstate-us-east1-9a2b"
    prefix = "terraform/state"
  }
}


resource "google_compute_disk" "grafana_disk" {
  name  = "grafana-disk"
  type  = "pd-standard"
  zone  = "us-east4-a"
  size  = 10
}