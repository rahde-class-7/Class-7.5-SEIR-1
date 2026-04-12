
Instructions:

## 1. Project Overview : VM Instance Deployment Using CLI

## 2. Deployment Instructions

Basic Configuration
1. Navigate to terminal
1. Enter the command gcloud init
2. Select an cloud project to use
3. Configure an default Region and Zone by typing yes
4. Selected us-east4a
5. vertifeid we seleted the correct region by entering gcloud config get compute/region
6. create an vm instance by entering the command

if you get the following error
``ERROR: (gcloud.compute.instances.create) Could not fetch resource:
---
code: ZONE_RESOURCE_POOL_EXHAUSTED``

this means you need to launch another instance type within said region

7. Enter the following command to list all possible instances within the zone gcloud compute machine-types list --zones=[ZONE]
8. Selected an instance from the list and used the following command to create an compute engine instance

``
gcloud compute instances create [INSTANCE_NAME] \
    --machine-type=[MACHINE_TYPE] \
    --zone=[ZONE]
``

9. added tags to vm so the network firewall will know to apply the firewall rules to the isntacne

``
gcloud compute instances add-tags [INSTANCE_NAME] \
    --tags=http-server,https-server \
    --zone=[ZONE]
``

10. Used the following command to vertify the configuration of the vm we created

``
gcloud compute instances describe [INSTANCE_NAME] --zone=[ZONE] --format=json
``

Show your work:
1) Browser proof
        Open: http://<EXTERNAL_IP>/


2) at the end of the lesson, SSH into your VM and curl it
    curl localhost
    curl -s localhost | head

3) Service Proof
    systemctl status nginx --no-pager

Bonus: For the fearless who want some head.

If you want the page to refresh every 10 seconds (extra dopamine):

Add this inside <head>:
    <meta http-equiv="refresh" content="10">

If you use supera.sh then....


1) Machine proof
        curl -s localhost/healthz

2) Engineer proof 
        curl -s localhost/metadata | jq .

SEIR-I Lab 1 Gate Philosophy 

Real engineers never say: --> “It works on my screen.”

They prove:
                The service is reachable
                The health endpoint works
                The metadata endpoint returns valid JSON
                The deployed infrastructure identifies itself

So the gate script checks exactly those things.

Lab 1 Gate Script
Find it here: --> hhttps://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weeka/script/gate_gcp_vm_http_ok.sh
#NOTE!!!! You need to find the IP and change it! 

Run it like this!
                VM_IP=34.82.55.21 ./gate_gcp_vm_http_ok.sh
Remember, 34.82.55.21 is an example!! That's not your IP!  You have to find your own IP!  Don't ask the teach about this!!


Example output:
                Lab 1 Gate Result: PASS
                
                PASS: Homepage reachable (HTTP 200)
                PASS: /healthz endpoint returned 'ok'
                PASS: /metadata returned valid JSON
                PASS: metadata contains instance_name
                PASS: metadata contains region

Files created:
                gate_result.json
                badge.txt

Example gate_result.json

                {
                  "lab": "SEIR-I Lab 1",
                  "target": "34.82.55.21",
                  "status": "PASS",
                  "details": [
                    "PASS: Homepage reachable (HTTP 200)",
                    "PASS: /healthz endpoint returned 'ok'",
                    "PASS: /metadata returned valid JSON"
                  ],
                  "failures": []
                }
