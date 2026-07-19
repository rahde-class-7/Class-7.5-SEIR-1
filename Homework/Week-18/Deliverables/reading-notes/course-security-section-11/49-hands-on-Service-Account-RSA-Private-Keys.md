we cant to give access to our service account via some private keys. we are gonna create some keys, give it to an person, and  they will have complete full access to our service account

what are keys
an way to access service accounts 
are like passwords
keys can be used for authentication
keys can be generated from ther cloud console

![alt text](image-27.png)
this command is used to activate the service account via an particular key

![alt text](image-28.png)
![alt text](image-29.png)
in the cloud console we have one service account, and the service account has access to the compute admin role

![alt text](image-30.png)
![alt text](image-31.png)
![alt text](image-32.png)
we are generating the keys for the service account
we downloaded the keys
we renamed the keys

![alt text](image-33.png)
![alt text](image-34.png)
in an different account we upload the keys

![alt text](image-35.png)
we confirm that we are using an different account from admin
this account does not have access to the project in admin

![alt text](image-36.png)
this command activates the service account

![alt text](image-37.png)
now the service account has been listed
since we have access to the service account via the keys

![alt text](image-38.png)
we are demonstrating that we have access to the permissions that the SA has
in this case we have permissions to interact with compute engine

the users/hacker will not get any blame because the service account is responsible for interacting with resources because impersonation

![alt text](image-39.png)
![alt text](image-40.png)
if the key gets compromised you can very easily delete it