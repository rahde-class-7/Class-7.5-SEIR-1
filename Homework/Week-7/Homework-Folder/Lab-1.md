This lab is designed to build a foundational understanding of Terraform while deploying actual resources in Google Cloud Platform (GCP). You will create a local configuration file, provision a GCS bucket, and manage dependencies using variables and outputs.

---

## Lab: Terraform Fundamentals on GCP

### 1. The Provider Configuration (`0-provider.tf`)
The **Provider** block tells Terraform which cloud or service to interact with. Here, we also define the **Provider Version** to ensure our code doesn't break if a new, incompatible version of the plugin is released.

```hcl
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Provider Versioning
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east1"
}
```

---

### 2. Variables & Input (`1-variables.tf`)
**Variables** allow you to make your code modular instead of hard-coding values.

```hcl
variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "env_name" {
  default = "dev"
}
```

---

### 3. Resources & Local Files (`2-main.tf`)
A **Resource Block** describes one or more infrastructure objects. We will use a **read_file** (via the `file()` function) to pull content into a **local_file** resource.



```hcl
# Reading a local public key or text file
# Usage: file(path)
locals {
  app_config = file("${path.module}/config.txt")
}

# local_file Resource: Creates a file on your machine
resource "local_file" "deployment_log" {
  filename = "${path.module}/deploy-summary.txt"
  content  = "Deploying ${var.env_name} environment with config: ${local.app_config}"
}

# Google Cloud Storage Bucket
resource "google_storage_bucket" "lab_bucket" {
  name          = "${var.project_id}-terraform-lab-bucket"
  location      = "US"
  force_destroy = true

  # Lifecycle Rules: Manage resource behavior (e.g., auto-delete)
  lifecycle {
    prevent_destroy = false 
    # Use ignore_changes = [labels] if you want to ignore manual edits in the GUI
  }
}
```

---

### 4. Dependencies & Outputs (`3-outputs.tf`)
Terraform usually handles **Dependencies** automatically (Implicit). If Resource A uses an attribute from Resource B, Terraform knows to build Resource B first. An **Output Block** prints information to your CLI after a successful run.

```hcl
# Implicit Dependency: This file "depends" on the bucket being created 
# because it references the bucket's name.
resource "local_file" "bucket_info" {
  filename = "bucket_details.txt"
  content  = "Bucket URL: ${google_storage_bucket.lab_bucket.url}"
}

output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = google_storage_bucket.lab_bucket.name
}

output "file_path" {
  value = local_file.deployment_log.filename
}
```

---

## Lab Steps to Execute

1.  **Prepare a Config File**: Create a file named `config.txt` in your directory and type `Production-v1` inside it.
2.  **Initialize**: Run `terraform init`. This downloads the **Google Provider**.
3.  **Plan**: Run `terraform plan`. Observe how Terraform reads the `config.txt` and prepares the bucket.
4.  **Apply**: Run `terraform apply`.
    * Confirm the **Output** values displayed in the terminal.
    * Check your local folder for `deploy-summary.txt` (created via **local_file**).
5.  **Inspect Lifecycle**: Try changing `prevent_destroy = true` in the lifecycle block and then running `terraform destroy`. Terraform will block the deletion to protect the resource.

---

### Summary of Concepts Covered
| Concept | Role in this Lab |
| :--- | :--- |
| **Provider** | Connects Terraform to GCP. |
| **Variables** | Passed your Project ID into the configuration. |
| **Resource Block** | Defined the GCS Bucket and the local file. |
| **Lifecycle Rules** | Controlled whether the bucket could be deleted. |
| **Outputs** | Printed the bucket's unique URL after the lab finished. |
| **Read File** | Used the `file()` function to inject external data into a resource. |