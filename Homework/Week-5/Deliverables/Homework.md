## Google Cloud Storage Terraform Backend Project Documentation Framework

### 1. Project Overview

Storing Terraform backend in the cloud to advoid accidential tampering, and deletion of Terraform code. The purpose is to enhance security

Used Google Cloud Storage to store Terraform state file. In this lab the process to store an backend into the cloud can be broken down into 2 phases

Phase 1: Infrastructure Preparation (Bucket & Auth) <br>
- Creation of directory to store the Terraform file. 
- Intizating the local machines terminal to google cloud so command in the terminal can launch resources within google cloud 
-  Creation of the Google Cloud Storage Bucket within the Google Cloud Console so tf.state can be stored within the cloud <br>

Phase 2: Migrating State to GCS Backend
- Creation of Terraform code to launch an reasource within Google Cloud
- Modifying backend resource block in order to store Terraform within Google Cloud Storage Service

---

### 2. Technical Architecture

* **Resource Inventory:** (Google Cloud Storage Buckets).
* **Decision Log:** Google Cloud Storage Service was used to store the Terraform.tf state file in the backend. it serves as a layer of security to prevennt tampering with the file, or accidential deletions.

---

### 3. Deployment Instructions
*Can another engineer (or your future self) recreate this in 5 minutes?*

Deployment instructions are a mix of deploying resources within the cloud via the CLI, GCP console, and Terraform

 * **(CLI):** Prepare the enviornment to launch resources by selecting default region, and zone.
* **(Console):** Launch an Google Cloud Storage Bucket to store tf.state backend
* **(IaC):** The backend to be stored in an Google Cloud Storage Bucket

* **Prerequisites:** Install gcloud SDK, Terraform.

### **Execution:**
### Phase 1: Infrastructure Preparation (Bucket & Auth)
Look for and Use `<PROJECT_ID>` in your lab. The `<PROJECT_ID>` is located in the Google cloud console page which is the landing page when you log into Google Cloud <br>

Copy the `<PROJECT_ID>` and paste it in notes to be referenced later. `<PROJECT_ID>` is vital for defailt configuration within the CLI


### Creating an Google Cloud Storage Bucket
Used Google Cloud Storage Service to make an bucket. This is where you will store the Terraform state file <br>
1. Navigated to `Cloud Storage > Buckets > clicked Create` <br>
2. Enter an value for name <br>
3. Leave all configuration as default value <br>
4. Click create

Copy the name of the bucket and pasted it somewhere for reference. This is vital because Terraform needs to know where to store the backend if we are configuring to store the backend in Google Cloud

### Navigated to CLI <br>
This is where we initialize Google Cloud. we are connect to Google Cloud via the CLI. This means we can create cloud infrastructure running commands

1. In the local machine launch the terminal
2. Run the initilization command `gcloud init` <br>
3. The terminal should display default values <br>
If no default values are displayed. configure the default values <br>

### Vertifying, and Configuring Default Values
Enter the following commands to vertify the default region and zone <br>
1. `gcloud config get-value compute/zone`
2. `gcloud config get-value compute/region`

If no default values were displayed follow the next few steps
1. list all possible regions, and zones
2. Set default values for region and zone

Listing all possible values
1. `gcloud compute zones list`
2. `gcloud compute regions list`

Setting default values
1. `gcloud config set compute/region [REGION_NAME]`
2. `gcloud config set compute/zone [ZONE_NAME]`

Enter the following commands to vertify the default region and zone <br>
1. `gcloud config get-value compute/zone`
2. `gcloud config get-value compute/region`

### Navigated to Repo <br>
Navigated to the following repo to get reference code for further configuration `https://github.com/rahde-class-7/SEIR-1`. 

1. Navigated to  `SEIR-1 > weekly_lessons > weekb > terraform_basics.txt` <br>
2. Copy the following command `gcloud auth application-default login` from terraform_basics.txt and paste the commnd in the terminal<br>
3. The browser will prompt the user for an gmail account to use <br>
4. The user is authenticated with the gcloud CLI so they can run Terraform <br>

### Naviagated to Folders in the Computer<br>
1. Navigated to `class-7.5 > SEIR-7.5 > weekb > terraform` <br>
2. Right click open GIT here <br>
3. Enter the command `code .` <br>
4. This is the file path to get to the right folder and open it in VScode <br>
5. This is done in a way to make it very easy <br>

In the Github navigated to weekb > terraform > 0-authentication.tf and copied the name <br>

### Navigated to VScode <br>
1. Created an terraform file called 0-authentication.tf <br>
- This is the file that tells Terraform to connect to GCP, what terraform version to use
2. Copy and pasted the code from the Github repo to the file we created <br>
3. From lines 23 to 30 erased them <br>
4. lines 1 to 23 should be available <br>
5. Put your `<PROJECT_ID>` in `provider block > project` <br>

Seleted new terminal within VScode <br>
Within the terminal entered the following commands <br>
1. terraform init
2. terraform validate
3. terraform plan <br>
    The following files Terraform lock, Terraform state file or .terraform contain sensitive environment metadata. Avoid manual modifications to these files, as it can lead to state corruption and deployment failures. These occurances could lead to termination
4. terraform apply

In the Github navigated to weekb > terraform > 1-backend.tf and copied the name <br>

### Phase 2: Migrating State to GCS Backend

### Navigated to VScode <br>
In this section we edited the Terraform file. we changed the zone to match the default zone when we intinalized the CLI, and we edited the bucket in the `terraform block` so it point to the bucket we create manually in the GUI

1. Created an Terraform file called 1-backend.tf <br>
2. Copy and pasted the code from the Github repo to the file we created <br>
3. Within the resource block `"google_compute_disk" "grafana_disk"` changed value of `zone` to `us-east4-a`

### Configuration to save tf.state in Google Cloud
We are going to save the state file in the cloud so it is not in the computer <br>

1. Went back to note pad and copied the name of the bucket we have created <br>
2. In `1-backend.tf` Terraform file we have an `terraform` resource block, and have an attribute of `bucket` <br>
3. As an value enter the name of the GCP bucket here <br>

### Summary Of Current Configuration <br>
1. Created an storage bucket within GCP
2. Created a Terraform file for the configuration of an cloud architecture
3. Added some Terraform files from theos repo into our local machine
4. Edited the file so what the Terraform state file is now stored into the cloud. an bucket within gcp

We made the bucket in the GUI first instead of within the Terraform file is because Terraform needs to be aware that the storage exists first before attempting to store the state file within the bucket

### In the VScode Console
5. In the terraform file `1-backend` > `terraform` resource block delete `required_providers` block. 

Entered the following commands <br>
3. `terraform plan` <br>
    you should see a file called Terraform lock, Terraform state file or .terraform you do not touch the file. you get fired instantly for touching this file <br>
4. `terraform apply`

At this point, this is where the Terraform state file is in the cloud

### Checked the GCP console for Terraform file
1. Navigated to the GCP console > buckets > clicked on `<bucket_created>` <br>
2. Now we see a Terraform folder <br>

The reason we want it to be in the cloud is so that it is less likley to have the JSON key in the repo <br>

* **Configuration Quirks:** [Any "gotchas," like waiting 5 minutes for a Global Load Balancer to propagate].

---

### Clean Up
1. Execute command `terraform destroy`

---

### 4. Verification & Quality Assurance (The "Proof")

* **Logs/Evidence:** Markdown blockquote of a successful command output or a screenshot.


---

### 5. Engineering Reflections

* **What went wrong?** [Be honest. Troubleshooting is a skill].
* **Future Improvements:** [e.g., "Next time, I would automate the firewall rules using a CI/CD pipeline"].
* **Certification Alignment:** [Which exam objective did this satisfy? PCA, PCSE, etc.]
* The 0-Authentication file is where all the code that allows Terraform to interact with GCP is located
* After creating the 1-backend.tf file why did exicuting terraform plan result in the following error ` Backend initialization required, please run "terraform init"
│ 
│ Reason: Initial configuration of the requested backend "gcs"` if we already initialize Terraform

* Needed to include an Gitignore file before attempting first commit for security reasons, and to push file into directory without error

---
