# Creating Managed Instance Groups Documentation

# RUNBOOK

## Overview

* Background: a drunk cloud engineer tried to update some settings. They broke several things. The VM now is not accessible as a web server on the public internet and ssh does not work.  
* Goal: troubleshoot a VM that does not work correctly, create a runbook so in the future when engineers are drunk it is easier to troubleshoot. Document all methods used even if they did not find the current issue as they may be helpful in the future.   
* Additionally, write a support ticket documenting what was happening when you first observed the VM, what you had expected it to do, and what the root cause was and reference your newly created documentation (the “anti-drunk engineer runbook”)   
* Ensure you document every step and method you use. 

## Navigation

- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>

## Prerequisites

To complete this lab

- you need An web browser  
- An google cloud account

## \< Step 1 \>

\< PARAGRAPH SUMMARY \>

- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>

## \< Step 1 \>

\< PARAGRAPH SUMMARY \>

- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>

## \< Step 1 \>

\< PARAGRAPH SUMMARY \>

- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>

## \< Step 1 \>

\< PARAGRAPH SUMMARY \>

- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>  
- \< Step 1 \>

---

## TERRAFORM

## Overview

\< PARAGRAPH SUMMARY \>

## Prerequisites

To complete this lab

- An web browser  
- An google cloud account  
- Terraform installed  
- Authentication from terraform to google cloud

## Directory Structure

create your Terraform configuration files and a directory structure that resembles the following:

Terraform/

 ├── 0-authentication.tf

 ├── 1-firewall.tf

 ├── 2-compute.tf

 ├── 3-variables.tf

 ├── 4-outputs.tf

## 0-authentication.tf

## 1-firewall.tf

## 2-compute.tf

## 3-variables.tf

## 4-outputs.tf

## Title

\< ANSWER\>

## Title

\< ANSWER\>

## Title

\< ANSWER\>

## Title

\< ANSWER\>

---

# ANTI-RUNBOOK

## Overview   
* Additionally, write a support ticket documenting what was happening when you first observed the VM, what you had expected it to do, and what the root cause was and reference your newly created documentation (the “anti-drunk engineer runbook”)   
* Ensure you document every step and method you use. 

---
### Q & A
 
### Explain what the traceroute and dig commands do. Compare and contrast.
- traceroute - pings the final destination of an packet, and each router on its way to its destination. Measures roune trip time packets took from each router and the destination. the time of the final destination in a traceroute should match the time of an ping

- dig - retrieves information about DNS name servers

### What are the 3 or 4 most common DNS records and what are their use cases? Give an overview of the steps in a TLS handshake.

What are the 3 or 4 most common DNS records <br>
- A record - used for IPv4 addresses
- AAAA record - used for IPv6 addresses
- CNAME record - Points a domain name to another domain name
- NAME SERVER record - identify the Authoritative Name Servers for your domain

An overview of the steps in a TLS handshake <br>

### How does an SSL/TLS cert know what domain it belongs to? 
Certificate Authority (CA)

### What is a certificate authority? 
third-party entities that issue digital certificates after validating the website owner.

### How do application load balancers in GCP offload (decrypt) SSL? What part of the load balancer does this?

\< ANSWER\>

### Are there use cases to have in flight encryption from the backend service to the backend itself? 

\< ANSWER\>

### Can multiple domains end up pointing to the same LB? 

\< ANSWER\>

### In the context of Cloud DNS, what are zones? 
- can be public or private
- 

\< ANSWER\>

---

### Documentation Used

For this assignment, I only used the official documentation provided in the homework, along with the Google Cloud Terraform Registry documentation for the Google provider and Compute Engine resources.

## Title

\< SOURCE \>

These pages were used to understand how managed instance groups behave in Google Cloud.

What I took from this: <br>
• instance groups are built using instance templates <br> 
• they manage VM creation and replacement automatically <br> 

## Title

\< SOURCE \>

\< WHY SOURCE WAS USED\>

## Title

\< SOURCE \>

\< WHY SOURCE WAS USED\>

## Title

\< SOURCE \>

\< WHY SOURCE WAS USED\>

## Title

\< SOURCE \>

\< WHY SOURCE WAS USED\>  