# Creating Managed Instance Groups Documentation
Plan
- study GCP study hub  MIG, auto scaling, 
- use cantril to study 3 tier architectures
- study terraform from my obsidian notes
- do an dry run of the plan
- review previous BAM

---
do the autoscaling lab i create on my own first. then do the following.

Go to BAM 1. Do it in the CLI first, document the steps, then write it in terraform

---

# RUNBOOK
## Overview
Managed Instance Groups illustrate operational excellence principals such as high availability and scalability within Google Cloud. Underlying components of instance groups allow an architect to achieve operational excellence within Google Cloud; instance templates, health checks, auto scaling, and auto healing influence high availability. In this runbook, step-by-step instructions are provided to configure an Managed Instance Group within Google Cloud.

## Navigation
- Step 1 Create the Instance Template
- Step 2 Create the Managed Instance Group 
- Step 3 Add a Firewall Rule
- Step 4 Test and Validate the Infrastructure

## Prerequisites

To complete this lab
- you need An web browser 
- An google cloud account

## Create the Instance Template
An Instance Template is an pre-made, re-useable, configuration created to provision an Compute engine instance. To restate, an instance template is made once; are reuseable which removing the need manually configure the instance. As an result, speed of provisioning virtual machines increases. The rapid provision leads an Instance Template to be used with Instance Groups; templates are the underlying component of Instance Groups to allow them to quickly deploy and destroy virtual machines

1. In the Google Cloud Console, navigate to **Compute Engine** > **Instance templates**.  
2. Click **Create instance template**.  
3. Configure the following settings  
   * Enter an value for **Name**  
   * **Location configuration:** Select **Regional** 
   * **Machine configuration:** Select **E2** series, and **e2-micro** **machine type** 
   * **Firewall configuration:** Select **Allow HTTP traffic**. 
   * **Advanced options** > Expand the **Networking** section.  
     * Enter an value for Network tag  
   * **Advanced options** > Expand the **Management** section.   
     * In the **Automation** input, and paste the following bash script into the value box:
```
\#\!/bin/bash

\# Install Apache and stress tool for testing

sudo apt-get update

sudo apt-get install \-y apache2 stress-ng

\# Write the hostname to the index file

echo "\<h1\>Hello from Google Cloud\!\</h1\>\<p\>Served from host: $(hostname)\</p\>" \> /var/www/html/index.html
```
4. Click **Create**.
5. End result
![Instance-Template](./Screenshots/instance-template.png)

## Create the Managed Instance Group 
Managed Instance Groups represents an collection of Compute Engine Instances; each instance uses the same instance template for configuration. To clarify, the instance template used to eliminate manual configuration of multiple compute engine instances. In return, provisioning of virtual machines are uniform and rapid. Creating VM's is faster; increases elasticity and high availability. The following are core features, autoscaling, autohealing, and regional deployments. These features are critical to the configuration below

1. Navigate to **Compute Engine** > **Instance groups**.  
2. Click **Create instance group**.  
3. Configure the following settings  
   * Enter an value for **Name**   
   * **Instance Template configuration:** Select the template created in **Create the Instance Template** Step.  
   * **Location configuration:** Select **Multiple Zones**.  
   * **Region configuration:** Select same region configured for instance template.  
4. **Autoscaling configuration**:  
   * Click on **Configure Autoscaling**
   * **Minimum number of instances:** `3`  
   * **Maximum number of instances:** `6`   
5. **Autohealing configuration**:  
   * Click the **Health check** > select **Create a health check**.  
   * Enter an value for **Name**  
   * **Protocol:** `HTTP`  
   * **Port:** `80`  
   * **Interval** 10 seconds  
   * **Timeout** 3 seconds  
   * Leave all other defaults and click **Save and continue**.  
6. Click **Create**. 
7. End result
![Managed-Instance-Group](./Screenshots/managed-instance-group.png)

## Add a Firewall Rule
To allow the communication with vm and enter commands to test the infrastructure

1. Navigate to **VPC network** > **Firewall**.  
2. Click **Create firewall rule**.  
   * Enter an value for **Name**  
   * **Targets:** `Specified target tags`  
   * **Target tags:** The tag we added to our template in **Create the Instance Template** Step 
   * **Source filter:** `IPv4 ranges`  
   * **Source IP ranges:** `0.0.0.0/0`  
   * **Protocols and ports:** Check **Specified protocols and ports**, select **tcp**, and enter `80`.  
3. Click **Create**.
4. End result
![Managed-Instance-Group](./Screenshots/firewall.png)

## Test/Validate the Infrastructure
**Validation A:** To test autoscaling, manipulate the virtual machine to create high CPU usage on the active VM. As an consequence, more virtual machines will be provisioned. after an specific time peroid compute engine instances will. be destroyed due to Cpu utilization being within normal limits

1. Navigate to **Compute Engine** > **VM instances**.  
2. Find the instance belonging to the MIG and click the **SSH**.  
3. Run the following increase CPU utilization  
```
   sudo apt-get install stress
``` 
```
   sudo stress --cpu 2 --timeout 500
``` 
4. Within 2-4 minutes, the Autoscaler will detect that the average CPU utilization of the group has exceeded the 60% threshold.  
5. Navigate to **Compute Engine** > **Instance groups** > `web-server-mig`.  
6. Refresh the page to view the **Instance count** chart or list. You will see the group scale out, adding a new VM instance to handle the load.  
7. End the SSH session (press `Ctrl+C` to stop `stress-ng`).  
8. After several minutes of normal load, the autoscaler will scale the instances back down to the minimum limit of `3`.

**Validation B:** To verify that the instance group provisioned instances across multiple zones navigate to instance groups and view its properties. Note: technical overview use cloudshell
![Managed-Instance-Group](./Screenshots/vertification-b-managed-instance-group-pt1.png)
![Managed-Instance-Group](./Screenshots/vertification-b-managed-instance-group-pt2.png)

---

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain how to enable autoscaling and autohealing <br>

---

## TERRAFORM
## Overview



## Navigation
- Step 1 
- Step 2  
- Step 3 
- Step 4 

## Prerequisites

To complete this lab
- you need An web browser 
- An google cloud account
- Terraform installed
- Authentication from terraform to google cloud

## Directory Structure
create your Terraform configuration files and a directory structure that resembles the following:
```
Terraform/
 ├── 0-authentication.tf
 ├── 1-vpc.tf.tf
 ├── 2-compute.tf
 ├── 3-variables.tf
```

## 0-authentication.tf
```
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>7.0.0"
    }
  }
}

provider "google" {
  project = "class-seven-point"
  region  = "us-central1"
}
```

## 1-vpc.tf
```

```

## 2-compute.tf
```
# CREATE COMPUTE ENGINE
resource "google_compute_instance" "confidential_instance" {
  name             = "my-confidential-instance"
  zone             = "us-central1-a"
  machine_type     = "n2d-standard-2"
  min_cpu_platform = "AMD Milan"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

  }
}
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Explain the mandatory (required) arguments for a VM in terraform <br>

- boot_disk - (Required) The boot disk for the instance. Structure is documented below.

- machine_type - (Required) The machine type to create.

- Note: If you want to update this value (resize the VM) after initial creation, you must set allow_stopping_for_update to true.

- Custom machine types can be formatted as custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY_MB, e.g. custom-6-20480 for 6 vCPU and 20GB of RAM. Because of current API limitations some custom machine types may get converted to different machine types (such as an equivalent standard type) and cause non-empty plans in your configuration. Use lifecycle.ignore_changes on machine_type in these cases.

- There is a limit of 6.5 GB per CPU unless you add extended memory. You must do this explicitly by adding the suffix -ext, e.g. custom-2-15360-ext for 2 vCPU and 15 GB of memory.

- name - (Required) A unique name for the resource, required by GCE. Changing this forces a new resource to be created.

- network_interface - (Required) Networks to attach to the instance. This can be specified multiple times. Structure is documented below.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Explain how to output the internal and external IP addresses of the provisioned VM and how you figured this out <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Choose 2 non-required arguments and give an explanation for both (do not copy and paste the reference material) <br>

- attached_disk - (Optional) Additional disks to attach to the instance. Can be repeated multiple times for multiple disks.

- tags - (Optional) A list of network tags to attach to the instance.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain how you would figure out the correct format for creating a VM with the “centOS stream 10” image (the specific image is up to you). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain the difference between the “name” argument and the computed “id” and “self_link” attributes <br>
- name - (Required) A unique name for the resource, required by GCE. Changing this forces a new resource to be created.
- id - an identifier for the resource with format projects/{{project}}/zones/{{zone}}/instances/{{name}}
- self_link - The URI of the created resource


---

### Q & A
Each bullet point can be between 1-5 sentences. You choose the amount of detail as long as I see that you understand it. <br>
### What is the difference between high availability and fault tolerance? Which is best to strive for? 
### Explain the difference between autoscaling and elasticity. What is vertical and horizontal autoscaling? Is one better? Are they feasible on prem? 
### Explain what the difference between managed and unmanaged instance groups is
### Explain the different use cases for health checks used by applications (in instance groups) and health checks used by load balancers. Can they be the same? Are they different API calls? Should they be the same? 
### Explain in a few sentences what the 3 tier architecture is and how it relates to what you are learning. 

---

### Decision Log
1. **Formatting**: Used similar language and formatting to Google Cloud documentatation to maintain an consistant tone. At the same time, documentation is written in a way so non-technical users can understand configurations. Lastly The author wrote the documentation to the tone of an college english papper to achieve an professional tone
2. **Testing Infrastructure**: Infrastructure test inspiration came directly from pluraslight lab

### Citations
https://partner.skills.google/paths/18/course_templates/1169/labs/608711
https://github.com/aws-samples/achieving-operational-excellence-using-automated-playbook-and-runbook <br>
https://www.skills.google/focuses/1206?parent=catalog <br>
https://dev.to/latchudevops/part-37-google-compute-engine-managed-instance-groups-stateful-in-google-cloud-platform-gcp-2ib4 <br>
https://docs.cloud.google.com/compute/docs/instance-groups/distributing-instances-with-regional-instance-groups <br>
https://docs.cloud.google.com/compute/docs/instance-groups/distributing-instances-with-regional-instance-groups <br>
https://www.skills.google/focuses/42740?parent=catalog <br>
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network <br>
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork <br>
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall