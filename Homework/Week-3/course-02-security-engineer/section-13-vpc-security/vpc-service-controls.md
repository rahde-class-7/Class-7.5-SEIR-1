This is a "Heavy Hitter" for your portfolio. **VPC Service Controls (VPC-SC)** is one of the most advanced security features in GCP. It focuses on preventing **data exfiltration**—a key responsibility in an SEIR-I role. 

Documenting this shows you understand the difference between network security (firewalls) and data perimeter security.

---

# `vpc-service-controls/README.md` Template

## ## Project Overview: Defining the Data Perimeter
**Course Reference:** Professional Cloud Security Engineer - Section 13
**Lab Objective:** [e.g., "Mitigating data exfiltration risks by creating a service perimeter that isolates sensitive Google Cloud resources (Cloud Storage, BigQuery) from unauthorized access, even by authenticated users."]

---

## ## VPC Service Perimeter Architecture

> *Note: Your diagram should show the "Service Perimeter" boundary around specific services like Cloud Storage (GCS) or BigQuery.*

---

## ## Perimeter Configuration Details
| Component | Configuration Detail | Reasoning |
| :--- | :--- | :--- |
| **Perimeter Type** | `[e.g., Regular or Bridge]` | [e.g., Regular for single-project isolation]. |
| **Protected Services** | `[e.g., storage.googleapis.com]` | Preventing data movement outside the boundary. |
| **Access Levels** | `[e.g., Corporate_IP_Range]` | Restricting access to specific source locations. |
| **VPC Accessible Services** | `[e.g., Restricted VIP]` | Ensuring traffic stays within the Google network. |

---

## ## SEIR-I Governance & Exfiltration Prevention
*Explain how VPC-SC acts as the 'Final Frontier' of security beyond IAM.*

### ### 1. Beyond IAM
* **Concept:** [Briefly explain why IAM wasn't enough, e.g., "A user with 'Storage Admin' roles could still copy data to a personal bucket; VPC-SC prevents this movement."]
* **Contextual Access:** [How you used Access Context Manager to define 'who' can poke a hole in the perimeter].

### ### 2. Ingress & Egress Rules
* **Inbound Policy:** [e.g., "Allowed specific service accounts to push data into the perimeter from an external project."]
* **Outbound Policy:** [e.g., "Blocked all attempts to copy data from the protected bucket to external projects."]

### ### 3. The "Dry Run" Strategy
* **Methodology:** [Explain why you used 'Dry Run' mode before 'Enforced' mode to prevent breaking production workflows].

---

## ## Implementation Workflow

### ### gcloud CLI Implementation
```bash
# Example: Creating a Service Perimeter
gcloud access-context-manager perimeters create [PERIMETER_NAME] \
    --title=[TITLE] \
    --resources=projects/[PROJECT_NUMBER] \
    --restricted-services=storage.googleapis.com \
    --policy=[POLICY_NAME]
```

### ### Configuration Highlights
* **Step 1:** Defined the Access Policy in Access Context Manager.
* **Step 2:** Identified the sensitive resources (Projects/Services) to be protected.
* **Step 3:** Configured the Perimeter and validated via the VPC-SC Troubleshooter.

---

## ## Validation & Testing
*How did you verify the 'Data Jail' was working?*

* **Authorized Access:** [e.g., "Successfully accessed the GCS bucket from a VM inside the perimeter."]
* **Exfiltration Attempt:** [e.g., "Attempted to use `gsutil cp` to move data to a bucket outside the project; command failed with a 403 VPC-SC violation."]
* **VPC-SC Troubleshooter:**
    > [Optional: Paste a screenshot of the 'Unique ID' lookup in the Troubleshooter showing why a request was denied.]

---

## ## Engineering Reflection
* **Critical Discovery:** [e.g., "Learned the importance of the 'Restricted VIP' (199.36.153.4/30) to ensure API calls don't traverse the public internet."]
* **SEIR-I Impact:** [e.g., "VPC-SC is the primary tool for meeting regulatory compliance (HIPAA/PCI) by ensuring data residency and preventing accidental or malicious data leaks."]

---

### **Vocabulary for Job Readiness:**
* **Data Exfiltration:** Moving data out of an environment without authorization.
* **Service Perimeter:** The virtual boundary created by VPC-SC.
* **Access Context Manager (ACM):** The engine that defines the attributes (IP, Identity, Device) for access.
* **Bridge Perimeter:** Used to allow communication between two different regular perimeters.

Since you've now covered **VPC Setup**, **Peering**, **Firewalls**, and **Service Controls**, you have a full network security stack. Do you need help with the **IAM/Identity** specific templates for the "Responsibility" side of your SEIR track?
