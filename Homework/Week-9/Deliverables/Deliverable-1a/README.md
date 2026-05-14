# Creating Managed Instance Groups Documentation

# RUNBOOK
## Overview
This runbook is indented to configure an external application global load balancer via GUI. It will use a MIG as the backend. Also, Including how to wire it up to a MIG. <br>

## Navigation
1. Create Instance Template
1. Create MIG
1. Create Health Check
1. Create Global LB

## Prerequisites

To complete this lab
- you need An web browser 
- An google cloud account

## Create Instance Template

1.   navigate to compute engine > instance templates
1. click create instance template
1. Add an value for instance template name
1. boot disk configuration: navigate to boot disk > click change
1. operating system configuration:
1. configuration: select cent os
1. click select
1. firewall configuration: select Allow HTTP traffic
1. navigate to management > automation script
1. Automation configuration: paste in script below

## Create Instance Group


### Load balancer configuration
1. navigate to compute engine > instance groups
1. click create instance group
1. Add an value for instance group name
1. select template previously created
1. number of instances 3

### Auto-scaling configuration
1. navigate to autoscaling > click configure
1. minium number of instances 3
1. max number of instances 6

### Auto-healing configuration
1. click on health check > create a health check
1. Add an value for instance group health check
1. check interval configuration: 10 seconds
1. unhealthy threshold configuration: 10

1. click create

## Create Global LB

### Load balancer configuration
1. Navigate to search bar > enter load balancers in search bar
1. click load balancing
1. click create load balancer
1. Load balancer type configuration: select application load balancer
1. internal or public configuration: select public facing
1. deployment configuration: select best for global workloads
1.  load balancer generation configuration: Global external Application Load Balancer
1.   click configure

### frontend configuration
1.   Add an value for load balancer name
1.   leave rest as default

### backend configuration
1.  backend service configuration: click create a backend service
1.   Add an value for backend service name
1.   health check configuration: select health check
1.   instance group configuration: select instance group
1.   port number configuration: 80
1.   click create

1.   click create

---

## TERRAFORM
## Overview
The following Terraform configuration includes the following, a custom VPC, firewall rules with target tags, and a MIG 


## Prerequisites

To complete this lab
- An web browser 
- An google cloud account
- Terraform installed
- Authentication from terraform to google cloud

## Directory Structure
create your Terraform configuration files and a directory structure that resembles the following:
```
Terraform/
 ├── 0-authentication.tf
 ├── 1-firewall.tf
 ├── 2-vpc.tf
 ├── 3-compute.tf
 ├── 4-variables.tf
 ├── 5-outputs.tf
```

## Deployment Instructions
1. Terraform plan
2. Terraform apply

## Outputs
```
output "dev-vpc-network-network_id" {
  value = google_compute_network.dev-vpc-network.network_id 
  description = "value"
}

output "project_id" {
  value = var.project_id
  description = "value"
}

output "instance-group-server-mig-self_link" {
  value = google_compute_instance_group_manager.server-mig.self_link
  description = "value"
}
```

---

### Q & A

### Load Balancers:
#### Do global load balancers decrease latency for end users? Why or why not? <br>
Global load balancers reduce latency by routing traffic to the backend that is closest to the users. when an configuration involves global load balancing. the global part is the fact that the backend resources are distributed all around the globe
#### What are LB health checks for? Do we always need them? Is a LB different from a reverse proxy? <br>
health checks are used to determine where to send traffic to when an instance is not available

### Cloud Armor:
#### What does cloud armor offer? <br>
Cloud Armor is an layer 7 firewall that protects your application from layer 7 attacks such as DDoS attacks. Cloud Armor can be integrated with Application load balancers to protect your application by blocking traffic before it interacts with the application
#### Why is it used in the first place? <br>
Cloud Armor is used as an security mechanism
#### What layer in the OSI model does it operate at? Why is this important and how is this firewall different from VPC firewall rules? <br>
Cloud Armor operates at layer 7 of the firewall. its important to know the difference between Cloud Armor and VPC Firewall rules; they operate at different levels
#### What are rate based rules for? <br>
Used to prevent against flooding of traffic from suspicious IP addresses

### Cloud CDN: 
#### What are POPs used for? <br>
Points-Of-presence are servers that are used to speed up the delivery of content
#### What kind of files are served with Cloud CDN? <br>
static files that dont change are often used with Cloud CDN
#### What services can be used with cloud CDN for the source of content (the origin)? <br>
Google Cloud Storage, Compute engines
#### Does Cloud CDN help protect against any types of malicious actors or cyberattacks? Explain. <br>
can help against by malicious attacks when combined with security services such as Cloud Armor
#### Should an enterprise always use cloud CDN? Why or why not? <br>
They should use cloud CDN when they have global users
#### What is TTL and how does it control content “freshness”? <br>
TTL is the amount of time data can be in the cache before it is considered stale, and gets deleted.


---

## Documentation Used
For this runbook, the following resources are used


### Understanding Start-up-script argument
[start-up-script argument](https://stackoverflow.com/questions/57682483/terraform-gcp-startup-script-local-file-instead-of-inline)

These pages were used to understand the syntax of `metadata_startup_script` Argument in the `google_compute_instance_template` resource block.

### Understanding Autoscaler For MIG
[Autoscaler For MIG](https://oneuptime.com/blog/post/2026-02-23-how-to-create-gcp-managed-instance-groups-with-terraform/view)

These pages were used to understand how to use autoscaler for MIG in the `google_compute_instance_template` resource block.

### Understanding Firewall Rules For MIG
[compute_firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall)

These pages were used to understand how to use firewall rules for MIG in the `google_compute_instance_template` resource block.

### Understanding VPC and Subnets
[VPC and Subnets](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork)

These pages were used to understand how to use VPC and Subnets
