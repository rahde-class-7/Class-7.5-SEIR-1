#### Phase 1: CREATE BUCKET

### A. CREATING BUCKET

resource "google_storage_bucket" "static-website-01" {
  name          = "static-website-01"
  location      = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page = "404.html"
  }
}

### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
#1. Terraform plan
#2. Terraform apply

#### Phase 2: UPLOAD OBJECTS

### B. UPLOADING OBJECTS INTO BUCKET
resource "google_storage_bucket_object" "index" {
 name         = "index.html"
 source       = "/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-7/Deliverables/Terraform/Website/index.html"
 bucket       = google_storage_bucket.static-website-01.id
}

#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

resource "google_storage_bucket_object" "error" {
 name         = "404.html"
 source       = "/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-7/Deliverables/Terraform/Website/404.html"
 bucket       = google_storage_bucket.static-website-01.id
}

#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

resource "google_storage_bucket_object" "image" {
 name         = "404.html"
 source       = "/Users/rahdejonesrahde/class-7.5/Class-7.5-SEIR-1/Homework/Week-7/Deliverables/Terraform/Website/rio-night.png"
 bucket       = google_storage_bucket.static-website-01.id
}

#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

#### Phase 3: ADDING PERMISSIONS TO ALLOW INTERNET ACCESS

resource "google_storage_bucket_iam_member" "public_viewer" {
  bucket = google_storage_bucket.static-website-01.name          
  role   = "roles/storage.objectViewer" 
  member = "allUsers"                  
}

#### Execute Terraform
##1. Terraform plan
##2. Terraform apply

#### Result
## AN GOOGLE CLOUD STORAGE BUCKET THAT USERS CAN ACCESS OBJECTS DIRECTLY VIA PUBLIC URL
