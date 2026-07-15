continues from the last video

![alt text](image-13.png)
we have already assigned from primitive roles to user john who is an user within the organization
we will explore roles to specific services

![alt text](image-14.png)
the editor role assigned was broad so we have full access to everything
we can create an Cloud SQL instance

![alt text](image-15.png)
we limit access so we can only create/interact with cloud storge
with storage admin john will have complete access to cloud storage but cannot interact with any other storage services

![alt text](image-17.png)
replace the editor role with cloud storage admin

![alt text](image-18.png)
went to john
when attempting to access compute engine we got an error
which tells us the permissions are working
we should only have access to cloud storage

![alt text](image-19.png)
created an bucket which tells us the permissions are working

![alt text](image-20.png)
and we uploaded an image to the bucket

![alt text](image-21.png)
if we go to cloud sql wee dont have access
we can use the missing permission and add it

![alt text](image-22.png)
we searched for the role that contained the missing permission
in this view we have multiple

![alt text](image-23.png)
from the last screen we assigned the cloud sql admin role to john and this fixes the issue because it contains the permission

![alt text](image-24.png)
now the policy works because the error is gone
it takes some time for the policy to take effect

![alt text](image-25.png)
we can also add members to users who exist outside of the organization