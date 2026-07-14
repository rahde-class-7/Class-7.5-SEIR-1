this is continuation from the previous lab

creating alerts
1. click on dashboards
2. click on VM instances
3. click on overview
4. click `3 recommended alerts`
5. check `VM disk ultilization too high`
6. set recomended threshold to `80`
7. set notification channel to email
8. clicked on alerting tab > navigated to policies
9. we see the alert 

creating an second alert
1. click `create slerting policy`
2. add an condition
    - select metric
    - resource type `vm instance`
    - metric `cpu utilization`
    - filter `instance_id`
    - aggregator `none`
    - peroid `2 minutes`

3. configuration
    - condition triggers if `any time series violate`
    - condition `is above`
    - threshold `50%`
    - for `most recent value`

4. who should get the notification
    - email
    - incident autoclose duration `1 day`

5. steps t fix the issue
    - alert name `US Central VM CPU Utilization`
    - click save

putting load on vm machine
1. navigated to VM machine
2. ssh into VM
3. sudo yum install -y epel-release 
4. sudo stress --cpu 2 --timeout 10m

checking to see if alert works
1. opened the alert we created for the cpu utilization in another tab
2. we should see that cpu utilization has risen
3. if we wait 5 minutes, and go to monitoring then we see an `incident`

reduced the load on the vm
1. ssh into the vm and enter the following key strokes `control + c`

vertify that alert works
1. check you email to see if the alert works

doing something on the incident
1. click `see all incidents`
2. click 3 dots
3. click acknowladge
2. click 3 dots
3. click close incident
4. go to alerting page
5. refresh alerting page
6. everything should be gone