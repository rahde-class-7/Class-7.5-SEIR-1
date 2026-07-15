this is an continuation from the last video

![alt text](image-26.png)
this is where we left off

![alt text](image-27.png)
we are gonna create an custom role from Storage Object Admin
change titile to custom gcs role

![alt text](image-28.png)
this is the current permission configuration

![alt text](image-29.png)
the custom role has been created as indicated under Custom GCS Role
Also under used in it says `custom`

![alt text](image-30.png)
in the filter if we searched `used in: custom` we see all of the custom roles we created

![alt text](image-31.png)
under `status` we can see that one of the custom roles has been deleted, but we see that we can restore the custom role even if it was deleted

![alt text](image-32.png)
![alt text](image-33.png)
![alt text](image-34.png)
for one of the users we switch the role of `object storage creator` to `custom gcs role`
note : you may need to reffresh the page for the role to appear

![alt text](image-35.png)
![alt text](image-36.png)
we get this error
it means that the permission showed in the error is not included in our role

we can create a bucket, but listing a bucket is still not possible

![alt text](image-37.png)
![alt text](image-38.png)
![alt text](image-39.png)
![alt text](image-40.png)
adding the permission to the custom gcs role
now the permission has been added to the role

![alt text](image-41.png)
now the user has the correct permissions, and the error is gone
note that, we dont have the permission to create the bucket

![alt text](image-42.png)
in the admin account we created an bucket

![alt text](image-43.png)
back to the user account we refreshed the page and we see this
we can see the bucket from the user account because the management account has created the bucket

![alt text](image-44.png)
![alt text](image-45.png)
![alt text](image-46.png)
we can upload files to the bucket

![alt text](image-47.png)
![alt text](image-48.png)
![alt text](image-49.png)
we attempt to delete the object but it dosent work
the object still exists

![alt text](image-50.png)
this is the issue

everything was sastified in the requirements

![alt text](image-51.png)
when creating an role from from scratch
there are no permissions at all
you need to select everything

note: we didnt create one from scratch we are showing you t is possible