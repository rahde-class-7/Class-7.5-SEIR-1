#### Phase 1: Create the Bucket

##### CREATING BUCKET
##2. Enter an name for the Google Storage bucket `static-website-01`
##3. Location type selected Multi-Region
##4. Storage class is standard
##5. For prevent public access unchecked `Enforce public access prevention on this bucket` 
##6. Clicked create

resource "google_storage_bucket" "static-website-01" {
  name          = "static-website-01"
  location      = "US"
  public_access_prevention = ""
  website {
    main_page_suffix = ""
    not_found_page = ""
  }
}

#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

#### Phase 2: TESTING BUCKET FUNCTIONALITY
##1. Uploaded image to bucket
##2. Copied and pasted public URL of image uploaded to test if connectivity to bucket is sucessful

resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket = "image-store"
}

#### THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply


#### Phase 3: ADDING PERMISSIONS TO ALLOW INTERNET ACCESS

##1. Navigated to permissions > view by roles > click grant access
##7. Add principal
##8. New principal field enter allUsers
##9. Select role > storage object viewer
##10. Click save
##11. Click allow public access

resource "google_project_iam_custom_role" "my-custom-role" {
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "A description"
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
}

resource "google_project_iam_member" "project" {
  project = "your-project-id"
  role    = "roles/editor"
  member  = "user:jane@example.com"
}

#### Execute Terraform
##1. Terraform plan
##2. Terraform apply

#### Result


#### Phase 4: Add Website Files, and Test Functionality
##1. Navigate to Cloud Storage > Buckets > locate bucket we created > click on 3 dots > edit website configuration
##2. Enter an name for index page suffix
##3. Enter an name for error page suffix
##4. add an index.html file to the bucket
##2. Copied and pasted public URL of html file uploaded to test if connectivity to bucket is sucessful

resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket = "image-store"
}

#### THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

#### Result

resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket = "image-store"
}

#### THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

#### Result

#### Execute Terraform
##1. Terraform plan
##2. Terraform apply