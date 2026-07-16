Demo
1. User kapil  will be used for the entire demo

part 1 of demo
1. at the project level assign the role of `Compute Admin`. means you have access to all parts of compute engine
2. at the organization level he gets assigned an editor role

from the last demo kapil has the `custom gcs role`

![alt text](<2026-07-15 09.55.17.png>)
added the role of compute admin to kapil

![alt text](<2026-07-15 09.58.41.png>)
we go back to kapils cloud console
we attempt to create an compute engine instance
we cant create the instance so the permission get activated yet

![alt text](<2026-07-15 09.59.52.png>)
now we can see the permission has been activated

![alt text](<2026-07-15 10.02.15.png>)
to test the permission we will attempt to access kubernetes engine
now we can see that we cant access google kubernetes engine
this means the permissions is working as intended

![alt text](<2026-07-15 10.02.15-1.png>)
the very first permission missing is `container.clusters.list`

![alt text](<2026-07-15 10.23.10.png>)
back at the admin console
the compute admin is granted at the project level

![alt text](<2026-07-15 10.24.39.png>)
selected the organization level

![alt text](<2026-07-15 10.26.39.png>)
added kail, and gave him some permissions

![alt text](<2026-07-15 10.28.27.png>)
we see the level of permissions that kapil has within admin

![alt text](<2026-07-15 10.29.26.png>)
went back to kapil user

![alt text](<2026-07-15 10.29.58.png>)
after providing the editor role we have access to kubernetes engine

![alt text](<2026-07-15 10.31.56.png>)
with the editor role we can access all gcp services

![alt text](<2026-07-15 10.40.09.png>)
theres no point of giving such broad permissions such as `Compute Admin` at hte project level

Demo
1. User kapil  will be used for the entire demo

part 2 of demo
1. provide 2 roles at the same level
2. example, provide two roles at the project level

note: everything is done at the project level

![alt text](<2026-07-15 10.45.01.png>)
added storage admin role

![alt text](<2026-07-15 10.46.05.png>)
from the root node. which is the organization level

![alt text](<2026-07-15 10.49.44.png>)
![alt text](<2026-07-15 10.51.56.png>)
![alt text](<2026-07-15 10.50.57.png>)
![alt text](<2026-07-15 10.53.45.png>)
inspecting Compute admin, and Storage Admin permissions
there are some overlapping permissions between the two
if you assign two roles at the same level the union of both roles are what get applied