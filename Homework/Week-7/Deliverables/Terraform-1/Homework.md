## Static Website Automated with GCS Project Documentation Framework

### 1. Project Overview
Deployment of an proof of concept static website that is entirely automated with GCS with some sample static assets Outcomes of the lab are The URL of the website, an output in the terraform of the fully formed (clickable) bucket URL 

---

### 2. Technical Architecture

* **Resource Inventory:** Google Cloud Storage Bucket
* **Decision Log:** 

---

### 3. Deployment Instructions
There are two versions for deployment instructions. First deployment instruction CLI, second deployment instuction is Terraform

#### CLI INSTRUCTIONS

#### Phase 1: Building the Static Website
Use Google Gemini to create an static website. <br>
The static website is an landing page for an salsa event located in elsie rooftop in midtown manhattan. The event occurs every friday starting at 6pm. The cover charge is 25$. The website is a single page static website that has an call to action to book your tickets

Note : build this website in increments so you can catch errors early on

#### Phase 2: Create the Bucket, and Test Functionality

##### CREATING BUCKET
1. Navigate to Cloud Storage > Buckets > clicked create
2. Enter an name for the Google Storage bucket `static-website-01`
3. Location type selected Multi-Region
4. Storage class is standard
5. For prevent public access unchecked `Enforce public access prevention on this bucket` 
6. Clicked create

##### TESTING BUCKET FUNCTIONALITY
1. Uploaded image to bucket
2. Copied and pasted public URL of image uploaded to test if connectivity to bucket is successful

###### Result
THIS ERROR <br>
The following error was shown when attempting to access an image uploaded to said bucket
![ERROR](../Images/Bucket-Error.png)

Solution <br>
Add an Role with the proper permissions to the bucket so the bucket can be accessed bia the public URL

What i learned <br>
allowing an bucket to accessed by users on the internet is not enough to grant access. the bucket needs the proper permissions to allow the users from the internet to interact with the bucket

##### ADDING PERMISSIONS TO ALLOW INTERNET ACCESS
1. Navigated to permissions > view by roles > click grant access
7. Add principal
8. New principal field enter allUsers
9. Select role > storage object viewer
10. Click save
11. Click allow public access

what i learned <br>
adding an new principal of all users makes the bucket accessible to anyone on the internet <br>
role of storage object viewer allows users to view objects within an bucket
click save <br>
you assign an role to to an bucket by going to permissions, assigning a role and a principal to it<br>

###### Result
You can view the Object within the bucket <br>
The following error was shown when attempting to access an image uploaded to said bucket
![ERROR](../Images/Bucket-Error-Solution.png)

#### Phase 3: Add Website Files, and Test Functionality
1. Navigate to Cloud Storage > Buckets > locate bucket we created > click on 3 dots > edit website configuration
2. Enter an name for index page suffix
3. Enter an name for error page suffix
4. add an index.html file to the bucket
2. Copied and pasted public URL of html file uploaded to test if connectivity to bucket is successful

#### Phase 4: added load balancers

#### TERRAFORM INSTRUCTIONS
#### PHASE 1 : Setting up folders and infrastructure <br>
1. Create the following files, and set-up the following directory structure
- Authentication allows terraform to interact with Google Cloud Storage
- Backend allows terraform state file to be stored in Google Cloud
- Storage is the configuration where our static website is being deployed
```
TERRAFORM2/
├── .terraform/
├── .terraform.lock.hcl
├── 0-authentication.tf
├── 1-backend.tf
├── 2-storage.tf
├── 3-output.tf
```
#### PHASE 2 : Setting up 0-authentication.tf file
Using the method in video 25 for authentication for the Google provider.   

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

#### PHASE 3 : Setting up 1-backend.tf file
Configuring Terraform state so it gets uploaded into the Cloud
```
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
```
#### PHASE 4 : Setting up 2-storage.tf file
Setting up an static website

### Phase 5: Terraform output
create an Terraform output to output the bucket URL

#### TERRAFORM INSTRUCTIONS

Create an terraform folder with 3 files `0-authentication`, `1-storage`, `2-output` <br>
Your directory structure should look like this <br>
```
TERRAFORM/
├── .terraform/
├── .terraform.lock.hcl
├── 0-authentication.tf
├── 1-storage.tf
├── 2-output.tf
├── Website ├── 404.html
            ├── index.html
            ├── styles.css
            └── image.png
```

Creating 0-authentication.tf
1. Create an terraform block, and provider block to allow communication between Terraform, and our Google Cloud Account
2. Your configuration should look like this 

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
  project = < PROJECT ID >
  region  = < REGION >
}
```

Creating 1-storage.tf
The 1-storage.tf terraform file is where all configuration for deploying the Google Cloud Storage Bucket is located. This configuration involves creating the bucket, uploading objects into the bucket, and adding permissions to allow internet users to access objects within the bucket

#### Phase 1: CREATE BUCKET

### A. CREATING BUCKET
Use the `google_storage_bucket` resource block to create an Google Cloud Storage Bucket to serve as the backend for the static website <br>
Apply some configuration to use specific files for the static website <br>

```
resource "google_storage_bucket" <name> {
  name          = <name>
  location      = <location>
  website {
    main_page_suffix = <html file>
    not_found_page =   <html file>
  }
}
```

after the website was created executed the following commands to verify we made the correct configuration and checked for errors
### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
#1. Terraform plan
#2. Terraform apply

#### Phase 2: UPLOAD OBJECTS
After `google_storage_bucket` resource block was used to create an Google Cloud Storage Bucket use `google_storage_bucket_object` to upload 3 Objects into the bucket. an HTML file, another HTML file, and an image

### B. UPLOADING OBJECTS INTO BUCKET
```
resource "google_storage_bucket_object" <name> {
 name         = <name>
 source       = <directory>
 bucket       = <bucket>
}
```

after the images were uploaded the following commands to verify we made the correct configuration and checked for errors
#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

After `google_storage_bucket_object` resource block was used to upload 3 Objects into the bucket. an HTML file, another HTML file, and an image
```
resource "google_storage_bucket_object" <name> {
 name         = <name>
 source       = <directory>
 bucket       = <bucket>
}
```

executed the following commands to verify we made the correct configuration and checked for errors
### Execute Terraform
#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply


```
resource "google_storage_bucket_object" <name> {
 name         = <name>
 source       = <directory>
 bucket       = <bucket>
}
```

executed the following commands to verify we made the correct configuration and checked for errors
### Execute Terraform
#### Execute Terraform
## THIS IS DONE TO CHECK FOR ERRORS
##1. Terraform plan
##2. Terraform apply

#### Phase 3: ADDING PERMISSIONS TO ALLOW INTERNET ACCESS
used the following resource block `google_storage_bucket_iam_member` to upload objects to the Google Cloud Storage Bucket
```
resource "google_storage_bucket_iam_member" "public_viewer" {
  bucket = <bucket>          
  role   = <role> 
  member = <member>                  
}
```

executed the following commands to verify we made the correct configuration and checked for errors
### Execute Terraform
#### Execute Terraform
##1. Terraform plan
##2. Terraform apply

#### Result
## AN GOOGLE CLOUD STORAGE BUCKET THAT USERS CAN ACCESS OBJECTS DIRECTLY VIA PUBLIC URL


---

### 4. Verification & Quality Assurance (The "Proof")

* **Logs/Evidence:** 


---

### 5. Engineering Reflections

This is a solid proof of concept for automating static asset delivery. Transitioning from the manual Google Cloud Console steps to Terraform highlights the core SRE principle of **Toil Reduction**.

Here are engineering reflection questions tailored to your specific lab steps, the transition to Terraform, and production-grade considerations.

---

## 1. Manual Configuration & IAM
**Focus:** Understanding the "Access Denied" hurdles and identity.

* **Step Reflection:** Why did unchecking `Enforce public access prevention` not immediately make your files visible in the browser? What is the functional difference between **Bucket-level settings** and **Object-level permissions**?
* **Design Decision:** You used the role `storage.objectViewer`. If this website also allowed users to upload photos of the Salsa event, which role would you have needed to add, and why would you apply it to a separate bucket?
* **Production Context:** In a corporate environment, using `allUsers` is often a security violation. How could you serve this website privately to only company employees using **Cloud IAP (Identity-Aware Proxy)**?



---

## 2. Infrastructure as Code (Terraform)
**Focus:** State management and automation logic.

* **Step Reflection:** In your `0-authentication.tf`, you hardcoded the Project ID and Region. What are the benefits of moving these to a `variables.tf` file for a production pipeline?
* **Design Decision:** Your `1-backend.tf` uses a GCS bucket to store the state file. What happens if two engineers try to run `terraform apply` at the same time? How does the GCS backend handle **State Locking**?
* **Production Context:** You uploaded objects one-by-one in Terraform. If your Salsa website had 500 images, would you continue using `google_storage_bucket_object` resource blocks, or would you use a different method (like `gsutil rsync` or a CI/CD pipeline)?

---

## 3. Storage Architecture
**Focus:** Optimization and performance.

* **Step Reflection:** You chose **Multi-Region** for the location. How does this choice affect the **Availability Service Level Agreement (SLA)** compared to a Single-Region bucket?
* **Design Decision:** Why is it important to define a `not_found_page` (404.html) in the `website` block? How does this improve the user experience (UX) for a potential guest looking for event details?
* **Production Context:** To reduce latency for users outside of New York, how would adding **Cloud CDN** (Content Delivery Network) on top of this bucket change the way your images are served?



---

## 4. Disaster Recovery & Reliability (The "VidiStream" Mindset)
**Focus:** Continuity and data integrity.

* **Step Reflection:** If you accidentally run `terraform destroy`, your website and images vanish. What Terraform attribute (e.g., `prevent_destroy`) or GCS feature (e.g., **Versioning**) would you enable to prevent data loss?
* **Design Decision:** Your backend configuration included a `google_compute_disk`. Since this is a static website lab, why might keeping persistent data on a disk be less efficient than keeping it in a GCS bucket?
* **Production Context:** If the `us-east4` region had a total outage, how quickly could you point your Terraform configuration to a different region to keep the Salsa event landing page live?

---

## 5. Cost & Efficiency
**Focus:** Resource optimization.

* **Step Reflection:** You used the **Standard** storage class. If you were storing historical archives of Salsa events from five years ago that no one looks at, which storage class would save the most money?
* **Design Decision:** How does the "Pay-for-what-you-use" model of GCS compare to running a small Nginx web server on a Compute Engine VM for this specific project?
* **Production Context:** How would you set up a **Budget Alert** in GCP to notify you if the egress traffic (users downloading your website images) exceeds $10.00?

---

### Suggested Next Action
To complete your **Verification & Quality Assurance** section, I recommend running `terraform output` to capture the `bucket_url` and then running a `curl -I <URL>` command to show the **200 OK** HTTP status code as evidence.

Would you like me to help you write the Terraform code for the **Cloud Load Balancer** mentioned in your Phase 4?

---
