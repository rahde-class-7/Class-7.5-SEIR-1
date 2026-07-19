Organization policies

what is policy applied at a organization

note 
organization level policies override user level policies

3 use cases of organization policies
1. disable service account creation
2. enforce uniform bucket-level access
3. skip default network creation

this video will be about disable service account creation

![alt text](<2026-07-19 14.07.03.png>)
![alt text](<2026-07-19 14.07.38.png>)
selected organization
any configuration made here will be made at the organization level

![alt text](<2026-07-19 14.09.59.png>)
navigated to service accounts
to view this we need to select an service account

![alt text](<2026-07-19 14.12.06.png>)
![alt text](<2026-07-19 14.13.36.png>)
creating the service account
named it and leave the rest as default

![alt text](<2026-07-19 14.14.29.png>)

navigated to organization policies
there are alot of policies, and these policies are defined by google

![alt text](<2026-07-19 14.21.35.png>)
![alt text](<2026-07-19 14.22.39.png>)
we see the disable service account organization policy

![alt text](<2026-07-19 14.23.25.png>)
edited the org policy
we see that the policy applies to a single project

![alt text](<2026-07-19 14.24.23.png>)
![alt text](<2026-07-19 14.31.56.png>)
changed it to apply at the organization level

![alt text](<2026-07-19 14.35.44.png>)
means that everything that is apart of this organization will have the policy applied to it

![alt text](<2026-07-19 14.36.48.png>)
applied these configuration settings, and saved

![alt text](<2026-07-19 14.38.37.png>)
now you wont to be able to create this service account in anything within the specified organization

![alt text](<2026-07-19 14.39.32.png>)
![alt text](<2026-07-19 14.40.05.png>)
creating an service account, and we get an error

this means no one can create service accounts within said organization

![alt text](<2026-07-19 14.42.31.png>)
usecase
applying the policy at the finance folde so no-one at the finacne department can create service accounts

![alt text](<2026-07-19 14.43.09.png>)
edited this setting and saved