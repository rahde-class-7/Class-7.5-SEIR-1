

1. clicked on monitoring
2. clicked, and opened the following dashboards in a new tab
    - View gce dashboard
    - View gke dashboard
    - go to logging
    - go to trace

add another project to monitoring scope
1. clicked metrics scope
2. clicked `add cloud projects to metrics scope`
3. select project you wanted to add

check cloud iam
1. navigated to cloud IAM
2. refreshed policy and nothing was added for project permissions
3. opened cloud console in new tab
4. clicked on the project you are monitoring

creating compute instance
1. navigated to compute engine
2. create an vm instance
3. leave everything as default but use CentOS image
4. allow http and https
5. click create the instance
4. create an second instance in another zone with an identical configuration

go back to monitoring
1. 

go to GCE dashboard
1. refresh the dashboard

note : it will take some time for the dashboard to update

2. opened vm dashboard in a new tab

we see a bunch of services in this dashboard

3. clicked on vm instances

note : on the vm instances we see that as a status we see `Monitoring agent status` = `not detected`, and `logging agent status` = `not detected`

installing agents
1. checked VM instance, and select `install agents` 
2. click run in cloudshell

note: when you click run in cloudshell the command is also printed in the cloudshell console
3. click enter <br>
4. we should see that the installation has completed <br>
5. execute steps 1 to 3 on the second vm instance <br>

we see `Monitoring agent status`, and `logging agent status` has changed

go to GCE dashboard
1. refresh the dashboard

note : dashboard should be updated