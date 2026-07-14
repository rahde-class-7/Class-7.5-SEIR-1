this is continuation from the previous lab

creating uptime check
1. clicked uptime checks tab
2. selected `create uptime check`
3.  enter title
4. select tcp
5. resource type is instance
6. applies to single
7. port number is `80`
8. check frequency is `1 minute`

    configure notification channel
    - click manage notification channels
    - add new email address
    - test the uptime check
    the test should fail because nothing is exicuting on port 80. no application is running on that port

navigate to compute engine
1. open up compute engine in a new tab
2. navigate to network interfaces section
3. click default under network value
4. clicked on firewall
5. searched for default allow http
6. open the rule

installing web server on instance
1. ssh into VM
2. enter command `cat /etc/centos-realease`
3. enter command `sudo yum update`
4. enter command `sudo yum install httpd`
5. enter command `sudo systemctl enable httpd`
6. enter command `sudo systemctl status httpd`

vertifying service
1. paste ip of the instance in the browser

finishing creating uptime check
1. select create uptime check

opened overview in a new tab <br>
now we see uptime checks <br>
clicked alerting <br>


opened alert policy
1. click alert policy