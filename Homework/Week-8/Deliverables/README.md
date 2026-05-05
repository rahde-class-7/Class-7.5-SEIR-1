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

To complete this lab, you need An web browser and An google cloud account

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

## Create the Managed Instance Group 
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

## Add a Firewall Rule
To allow the load balancer and test traffic to reach your backend instances, ensure port 80 is open.

1. Go to **VPC network** \> **Firewall**.  
2. Click **Create firewall rule**.  
   * Enter an value for **Name**  
   * **Targets:** `Specified target tags`  
   * **Target tags:** The tag we added to our template in **Create the Instance Template** Step 
   * **Source filter:** `IPv4 ranges`  
   * **Source IP ranges:** `0.0.0.0/0`  
   * **Protocols and ports:** Check **Specified protocols and ports**, select **tcp**, and enter `80`.  
3. Click **Create**.

## Test the Infrastructure
### Task B: Stress Test the Autoscaler

To test autoscaling, we need to create high CPU usage on the active VM.

1. Go to **Compute Engine** > **VM instances**.  
2. Find the instance belonging to the MIG and click the **SSH**.  
3. Run the following command to pin the CPU at high utilization for 10 minutes:  
```
   sudo apt-get install stress
``` 
```
   sudo stress --cpu 2 --timeout 500
``` 
4. Within 2-4 minutes, the Autoscaler will detect that the average CPU utilization of the group has exceeded the 60% threshold.  
5. Go to **Compute Engine** \> **Instance groups** \> `web-server-mig`.  
6. Refresh the page to view the **Instance count** chart or list. You will see the group scale out, adding a new VM instance to handle the load.  
7. End the SSH session (press `Ctrl+C` to stop `stress-ng`).  
8. After several minutes of normal load, the autoscaler will scale the instances back down to the minimum limit of `1`.

---

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain how to enable autoscaling and autohealing <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain how to verify that the instance group will manage instances across multiple zones <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f. Explain any other critical config explicitly <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g. Remember this is for other engineers so no need to try to explain everything like I am a nontechnical person. Also keep in mind runbooks are not for learning but for executing something properly.  Keep it pretty high level. Use whatever amount of detail you feel is correct. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;h. Test it by having a group mate use this runbook to accomplish the goal. They should be able to rely on it only to spin up a properly configured instance group. <br>

---

## TERRAFORM
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Explain the mandatory (required) arguments for a VM in terraform <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Explain how to output the internal and external IP addresses of the provisioned VM and how you figured this out <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Choose 2 non-required arguments and give an explanation for both (do not copy and paste the reference material) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain how you would figure out the correct format for creating a VM with the “centOS stream 10” image (the specific image is up to you). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain the difference between the “name” argument and the computed “id” and “self_link” attributes <br> 

---

### Q & A
Each bullet point can be between 1-5 sentences. You choose the amount of detail as long as I see that you understand it. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. What is the difference between high availability and fault tolerance? Which is best to strive for? <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain the difference between autoscaling and elasticity. What is vertical and horizontal autoscaling? Is one better? Are they feasible on prem? <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain what the difference between managed and unmanaged instance groups is.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f. Explain the different use cases for health checks used by applications (in instance groups) and health checks used by load balancers. Can they be the same? Are they different API calls? Should they be the same? <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g. Explain in a few sentences what the 3 tier architecture is and how it relates to what you are learning. <br>

---

### Citations
https://partner.skills.google/paths/18/course_templates/1169/labs/608711
https://github.com/aws-samples/achieving-operational-excellence-using-automated-playbook-and-runbook <br>
https://www.skills.google/focuses/1206?parent=catalog <br>
https://dev.to/latchudevops/part-37-google-compute-engine-managed-instance-groups-stateful-in-google-cloud-platform-gcp-2ib4 <br>
https://docs.cloud.google.com/compute/docs/instance-groups/distributing-instances-with-regional-instance-groups <br>
https://docs.cloud.google.com/compute/docs/instance-groups/distributing-instances-with-regional-instance-groups <br>