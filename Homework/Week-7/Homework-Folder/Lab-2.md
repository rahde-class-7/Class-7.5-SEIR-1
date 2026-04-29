This lab focuses on the "First Mile" of Terraform: establishing a secure, version-controlled bridge between your local machine and Google Cloud Platform (GCP).

---

## Lab: Connecting Terraform to GCP

### 1. Declaring the Provider & Version
The `terraform {}` block is where you define the **metadata** for your project. This is where you pin the **Provider Version** to ensure that your infrastructure is stable even if HashiCorp or Google releases a new version with breaking changes.



Create a file named `0-provider.tf`:

```hcl
terraform {
  # 1. Terraform Version (The CLI version itself)
  required_version = ">= 1.5.0"

  # 2. Provider Version (The Google plugin version)
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Allows minor updates but locks major version 5
    }
  }
}

# 3. Provider Configuration
provider "google" {
  project = "your-project-id" # Replace with your actual Project ID
  region  = "us-east1"
}
```

---

### 2. Authentication: The Two Main Methods
To "connect" to GCP, Terraform needs credentials. There are two industry-standard ways to handle this.

#### Method A: Application Default Credentials (Recommended for Learning)
This uses your personal Google login. It is the easiest way for students and developers to get started without managing complex JSON key files.

1.  Open your terminal.
2.  Run the following command:
    ```bash
    gcloud auth application-default login
    ```
3.  A browser window will open. Log in with your Google account.
4.  Terraform will now **automatically** find these credentials on your machine.

#### Method B: Service Account Impersonation (Production Standard)
In professional environments, we avoid using personal accounts. Instead, we use a **Service Account** with "Least Privilege" permissions.

> **Note:** As of 2026, Google strongly discourages downloading `.json` key files because they are a security risk if accidentally uploaded to GitHub. Instead, use **ADC Impersonation**:

```bash
# Log in as yourself first
gcloud auth login

# Set up ADC to "act as" a specific service account
gcloud auth application-default login --impersonate-service-account=terraform-sa@your-project.iam.gserviceaccount.com
```

---

### 3. Initializing the Bridge
Once your code is written and you have authenticated, you must "initialize" the working directory.

1.  Run `terraform init`.
2.  **What happens?**
    * Terraform looks at your `required_providers` block.
    * It downloads the `hashicorp/google` plugin into a hidden `.terraform` folder.
    * It creates a `.terraform.lock.hcl` file (The **Dependency Lock File**) to ensure everyone on your team uses the exact same version.

---

### 4. Lab Challenge: Verify the Connection
Add this simple resource to a new file called `main.tf` to test if the connection works:

```hcl
resource "google_project_service" "compute_api" {
  project = "your-project-id"
  service = "compute.googleapis.com"

  # This ensures the API is enabled so you can create VMs later
  disable_on_destroy = false
}
```

1.  Run `terraform plan`. 
    * If you see "Plan: 1 to add," your **authentication** is successful.
2.  Run `terraform apply`.
    * If it completes, you have successfully "connected" Terraform to your GCP project.

---

### Key Takeaways for your Portfolio
* **Version Pinning:** Using `~> 5.0` protects you from breaking changes in major updates.
* **ADC (Application Default Credentials):** The standard way to provide credentials to Terraform without hardcoding secrets.
* **Initialization:** The `terraform init` command is the moment the "Google Provider" is actually installed.