This lab focuses on the fundamental networking components in Google Cloud Platform (GCP). You will build a Virtual Private Cloud (VPC), a custom subnet, and a firewall rule to allow specific traffic.

---

## Lab: Networking Fundamentals with Terraform

### 1. The Architecture
In GCP, a VPC is a global resource. Subnets are regional, and Firewalls are applied at the VPC level to control traffic to instances.



---

### 2. Provider and Variables (`0-setup.tf`)
Before building the network, we define our provider and the Project ID.

```hcl
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

variable "project_id" {
  type = string
}
```

---

### 3. Creating the VPC (`1-vpc.tf`)
A **VPC (Virtual Private Cloud)** is your private network in the cloud. By setting `auto_create_subnetworks` to `false`, we follow the "Production-Grade" best practice of manually defining our IP ranges.

```hcl
resource "google_compute_network" "main_vpc" {
  name                    = "lab-vpc"
  auto_create_subnetworks = false # Critical for custom networking
  mtu                     = 1460
}
```

---

### 4. Creating the Subnet (`2-subnet.tf`)
The **Subnet** defines a specific IP range within a region. Notice the **Implicit Dependency**: the `network` argument refers to the VPC resource created above.

```hcl
resource "google_compute_subnetwork" "public_subnet" {
  name          = "lab-subnet-public"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.main_vpc.id
}
```

---

### 5. Creating Firewall Rules (`3-firewall.tf`)
**Firewall Rules** allow or deny traffic to your resources. This rule will allow SSH traffic (Port 22) from any source to any VM within our VPC.



```hcl
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-inbound"
  network = google_compute_network.main_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Source range 0.0.0.0/0 represents the entire internet
  source_ranges = ["0.0.0.0/0"]
  
  # Target tags allow you to apply this rule only to specific VMs
  target_tags = ["ssh-enabled"]
}
```

---

### 6. Lab Execution Steps

1.  **Initialize**: Run `terraform init` to download the Google provider.
2.  **Validate**: Run `terraform validate` to ensure your syntax is correct.
3.  **Plan**: Run `terraform plan -var="project_id=YOUR_PROJECT_ID"`.
    * Review the plan. You should see 3 resources to add: 1 network, 1 subnet, and 1 firewall.
4.  **Apply**: Run `terraform apply -var="project_id=YOUR_PROJECT_ID"`.
5.  **Verify in GCP Console**:
    * Navigate to **VPC Network** > **VPC networks** to see your "lab-vpc".
    * Click on the VPC to see your "lab-subnet-public" in `us-central1`.
    * Go to **VPC Network** > **Firewalls** to see your "allow-ssh-inbound" rule.

---

### Key Concepts Summary
* **VPC**: The isolated network container.
* **Subnet**: A regional partition of the VPC with a specific IP range (CIDR).
* **Firewall Rule**: A security gatekeeper that uses `source_ranges` and `allow` blocks to manage traffic.
* **Implicit Dependency**: Terraform automatically knew to create the VPC *before* the subnet because the subnet code referenced `google_compute_network.main_vpc.id`.