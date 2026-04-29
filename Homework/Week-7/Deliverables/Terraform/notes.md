O-auth file <br>
This is the first file <br>

the following code block communncates with terrafrom to incdicate how to communicate with the cloud envionrment, and what version of terraform to install
```
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" 
    }
  }
}

provider "google" {
  project = "class-seven-point"
  region  = "us-east4"
}
```

##### CREATING BUCKET
##2. Enter an name for the Google Storage bucket `static-website-01`
##3. Location type selected Multi-Region
##4. Storage class is standard
##5. For prevent public access unchecked `Enforce public access prevention on this bucket` 
##6. Clicked create

resource "google_storage_bucket" "static-website-01" {
  name          = "static-website-01"
  location      = "US"
  ##public_access_prevention = ""
  website {
    main_page_suffix = "index.html"
    not_found_page = "404.html"
  }
}

1. Creating the bucket with the following code does not mean the files are in the bucket. Only means that bucket website configuration has been made. which means the bucket knows what files to use as website code. does not mean the bucket has the code files in it <br>
2. To vertify that the bucket was created navigated into the GUI
```
website {
    main_page_suffix = "index.html"
    not_found_page = "404.html"
  }
```

to upload an object into google cloud storage you need to use another code block `google_storage_bucket_object` <br>

when attempted to run the configuration to add files into this error <br>
the error occured because dots `.` and `404` cannot be an resource name. so, `index.html` and `404.html` caused the error <br>
```
rahdejonesrahde@rahdes-MacBook-Pro Terraform % terraform plan 
╷
│ Error: Invalid resource name
│ 
│   on 2-storage.tf line 26, in resource "google_storage_bucket_object" "index.html":
│   26: resource "google_storage_bucket_object" "index.html" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
╵
╷
│ Error: Invalid resource name
│ 
│   on 2-storage.tf line 34, in resource "google_storage_bucket_object" "404.html":
│   34: resource "google_storage_bucket_object" "404.html" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
```

when used terraform apply to add resources to the bucket got the following error <br>
solution use full path <br>
```
│ Error: open ~/Terraform/Website/index.html: no such file or directory
│ 
│   with google_storage_bucket_object.index,
│   on 2-storage.tf line 26, in resource "google_storage_bucket_object" "index":
│   26: resource "google_storage_bucket_object" "index" {
│ 
╵
╷
│ Error: open ~/Terraform/Website/404.html: no such file or directory
│ 
│   with google_storage_bucket_object.error,
│   on 2-storage.tf line 34, in resource "google_storage_bucket_object" "error":
│   34: resource "google_storage_bucket_object" "error" {
```
to vertify that the objects placed into the bucket. create an output where the public URL is the output 

Questions <br>
how do you upload an file to an google storage bucket if your using terraform <br>

what does `public_access_prevention` do <br>
what are memembers and what are member types <br>

ran into the following error when attempting to do terraform apply after attempting to create permission <br>
error occured becasue of this syntax error `member  = "allUsers"`, changed the syntax to `member  = "user:allUsers"` <br>
The error PROJECT_SET_IAM_DISALLOWED_MEMBER_TYPE means that you cannot add allUsers as a member at the Project level.

While the error text says members must be prefixed with user:, group:, etc., it’s actually failing because Google Cloud blocks public access (allUsers) from being applied to an entire project via the Resource Manager API. This is a safety feature to prevent you from accidentally making your entire infrastructure public <br>
solution, use `google_storage_bucket_iam_member` resource block to aplly permisisons on. the bucket lebel rather than the project level
```
Request `Create IAM Members roles/storage.viewer allUsers for project "class-seven-point"` returned error: Error applying IAM policy for project "class-seven-point": Error setting IAM policy for project "class-seven-point": googleapi: Error 400: Policy members must be of the form "<type>:<value>".
│ Details:
│ [
│   {
│     "@type": "type.googleapis.com/google.rpc.BadRequest",
│     "fieldViolations": [
│       {
│         "description": "Policy members must be prefixed of the form '\u003ctype\u003e:\u003cvalue\u003e', where \u003ctype\u003e is 'domain', 'group', 'serviceAccount', or 'user'.",
│         "field": "policy.bindings.member"
│       }
│     ]
│   },
│   {
│     "@type": "type.googleapis.com/google.rpc.ErrorInfo",
│     "domain": "cloudresourcemanager.googleapis.com",
│     "reason": "PROJECT_SET_IAM_DISALLOWED_MEMBER_TYPE"
│   },
│   {
│     "@type": "type.googleapis.com/google.rpc.ResourceInfo",
│     "resourceName": "projects/class-seven-point"
│   }
│ ]
│ , badRequest
│ 
│   with google_project_iam_member.class-seven-point,
│   on 1-storage.tf line 49, in resource "google_project_iam_member" "class-seven-point":
│   49: resource "google_project_iam_member" "class-seven-point" {
│ 
╵
```