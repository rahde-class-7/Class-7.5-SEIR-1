## WEEK 8 (Assigned: FRI 5/1/26 \- Due: THU 5/7/26) ASSIGNMENTS

Readings, Videos, and Labs

Udemy:

* Masterclass: Section 11  
* Terraform: Section 7

Books: 

* Packt  
  * Review chapter 4 on instance groups; templates; autohealing; autoscaling if needed (this section was previously assigned)  
  * Chapter 10  
* Terraform: Chapters 3-4

Documentation: 

* Instance Groups  
  * [https://docs.cloud.google.com/compute/docs/instance-groups\#managed\_instance\_groups](https://docs.cloud.google.com/compute/docs/instance-groups#managed_instance_groups)  
  * https://cloud.google.com/instance-groups?hl=en  
* Load Balancing   
  * [https://cloud.google.com/load-balancing?hl=en](https://cloud.google.com/load-balancing?hl=en)  
  * [https://docs.cloud.google.com/load-balancing/docs/application-load-balancer](https://docs.cloud.google.com/load-balancing/docs/application-load-balancer)  
  * [https://docs.cloud.google.com/load-balancing/docs/https](https://docs.cloud.google.com/load-balancing/docs/https)  
  * [https://docs.cloud.google.com/load-balancing/docs/application-load-balancer\#three-tier\_web\_services](https://docs.cloud.google.com/load-balancing/docs/application-load-balancer#three-tier_web_services)  
  * https://levelup.gitconnected.com/load-balancing-on-google-cloud-platform-gcp-why-and-how-a8841d9b70c  
* Solutions Architecture  
  * https://docs.cloud.google.com/architecture/infra-reliability-guide/design  
  


#### Deliverables:

- Use your normal HW github repo to submit this. 
- Include all documentation and resources you used,and how you used it and be specific.
### README
- Add a readme of some kind for this week.<br>
&nbsp;&nbsp;&nbsp;&nbsp;a. For all questions and documentation assume I am a junior employee new to cloud infrastructure. Assume I have some technical knowledge but you will be covering these concepts from the ground up.<br>
### Q & A
&nbsp;&nbsp;&nbsp;&nbsp;b. Answer the following questions in a section called “Q & A”:<br>
Each bullet point can be between 1-5 sentences. You choose the amount of detail as long as I see that you understand it. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. What is the difference between high availability and fault tolerance? Which is best to strive for? <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain the difference between autoscaling and elasticity. What is vertical and horizontal autoscaling? Is one better? Are they feasible on prem? <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain what the difference between managed and unmanaged instance groups is.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f. Explain the different use cases for health checks used by applications (in instance groups) and health checks used by load balancers. Can they be the same? Are they different API calls? Should they be the same? <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g. Explain in a few sentences what the 3 tier architecture is and how it relates to what you are learning. <br>
### Runbook
- In a section called “runbook” <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. In the first few sentences (3 max) explain the end goal. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Add a section on prerequisites (what do I, as an engineer, need to have ready to make this happen?) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Goal: a fully configured managed instance group <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain how to enable autoscaling and autohealing <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain how to verify that the instance group will manage instances across multiple zones <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f. Explain any other critical config explicitly <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g. Remember this is for other engineers so no need to try to explain everything like I am a nontechnical person. Also keep in mind runbooks are not for learning but for executing something properly.  Keep it pretty high level. Use whatever amount of detail you feel is correct. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;h. Test it by having a group mate use this runbook to accomplish the goal. They should be able to rely on it only to spin up a properly configured instance group. <br>
### Terraform
- In a section called “terraform” <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Explain the mandatory (required) arguments for a VM in terraform <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Explain how to output the internal and external IP addresses of the provisioned VM and how you figured this out <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Choose 2 non-required arguments and give an explanation for both (do not copy and paste the reference material) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Explain how you would figure out the correct format for creating a VM with the “centOS stream 10” image (the specific image is up to you). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Explain the difference between the “name” argument and the computed “id” and “self_link” attributes <br>
### Lab
- In a subdirectory called “terraform” <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. A .gitignore file (ask group leader if unsure) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Critical requirements <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. No state file can be committed to your repo <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. No provider binaries (.terraform dir) if you somehow figure out Git LFS <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. Your code must be able to be cloned and ran (terraform init, validate, apply) as is <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. Submission is not acceptable without meeting these <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. A terraform config conforming to best practices <br>
&nbsp;&nbsp;&nbsp;&nbsp; This includes: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Terraform {} code block <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Ideally this has versioning requirements for the terraform binary of at least 1.10  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Provider {} code block <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Latest provider version <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Comments where needed to make config self-documenting <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Follow style guide for naming conventions <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f. Idiomatic formatting (hint: there is a command for this) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g. Files separated in a logical manner and numbered <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;h. Resources must logically build on each other <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i. No unneeded explicit dependencies <br>
&nbsp;&nbsp;&nbsp;&nbsp;1. The Terraform config must provision a VM <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Must have an external IP <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Must use the “centOS stream 10” OS image <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. The root persistent disk must be 100 GB <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Must be a machine type in the N series (you choose!) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. For the startup script use the following script <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.  Put the script in the startup script argument however you like <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Startup scripts Theo has provided will not work because CentOS is a flavor of RHEL so some commands are slightly different <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.Feel free to look at the script, I added some simple comments to understand it <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.Command to get script: 
```
curl -o startup.sh https://raw.githubusercontent.com/aaron-dm-mcdonald/class7.5-notes/refs/heads/main/week-8/hw/startup-for-rhel.sh 
``` 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Put it in the default vpc (or do the BAM, see below)) and use this argument too: “tags = [“http-server”] or port 80 will not open or you make a separate firewall rule (either is fine). The former option is easiest. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Do not include unneeded arguments <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. The terraform config must include output <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.for the internal and external IP addresses of the VM <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.For the name, id and self_link attributes <br>

#### Be a man: 

Be a man 1: <br>
- Expand the the existing VM 
- Write terraform config for your own VPC, subnet and firewall 
- Write the output for both IP addresses using only one output code block and explain what it is and how you did this 
- Remove the tags = [“http-server”] argument value but keep the “tags = [ ]” argument and add a tag to your custom firewall rule 

Be a man 2: <br>
- Expand BAM1 but write a VM template resource and use it to provision the VM all with terraform 
- Document how you solved this carefully 

