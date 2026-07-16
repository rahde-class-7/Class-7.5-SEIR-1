![alt text](<2026-07-15 12.13.49.png>)
two methods for access scope
1. Legacy
2. Modern: IAM

![alt text](<2026-07-15 12.16.26.png>)
These are two virtual machines that were created from a previous lab

![alt text](<2026-07-15 12.17.27.png>)
look at the access scope in one of the vm's

![alt text](<2026-07-15 12.18.23.png>)
we see the default values

![alt text](<2026-07-15 12.19.35.png>)
list all of the buckets by entering this command within the default service account vm

this vertifies we have read access to google cloud storage

![alt text](<2026-07-15 12.21.49.png>)
stopped the machine
edit the configuration
allows full access to all api's

![alt text](<2026-07-15 12.26.49.png>)
allow access to all api's

![alt text](<2026-07-15 12.28.29.png>)
if we use set access. we define the level of access for each service

changed storage to none

and click save

![alt text](<2026-07-15 12.31.05.png>)
start the machine
ssh into the machine
the command works, and this shoulddnt be happening
takes a couple of minutes for the changes to take effect

![alt text](<2026-07-15 12.33.35.png>)
if we use sudo then we encouner the error

![alt text](<2026-07-15 12.36.00.png>)
deleted the folder

![alt text](<2026-07-15 12.37.13.png>)
now we should get the error when we dont use sudo

![alt text](<2026-07-15 12.37.59.png>)
modified the settings change storage to go from read access

![alt text](<2026-07-15 12.39.01.png>)
we get this error eventhough we have access enabled

![alt text](<2026-07-15 12.40.28.png>)
removed the folder, and the command works

![alt text](<2026-07-15 12.41.59.png>)
for custom service accounts it can only have iam option. it has no legacy option