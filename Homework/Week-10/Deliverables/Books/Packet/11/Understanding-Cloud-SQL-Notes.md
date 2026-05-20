# Understanding Cloud SQL
- Cloud SQL is a managed database service for the purpose of simplifying deployments of databases within Google Cloud
- Underlying Component of Cloud SQL are Compute engin instances
- Cloud SQL can handle storage up to 64 tb
- Cloud SQL is relational to databases is organized into tables, rows, and columns
- We can install an SQL database engine on compute engine instance it self, but the managed characteristic of compute engine means the following. scalability, patching, and updates are applied automatically, automated backups are
provided, and it offers HA out-of-the-box. in simple terms, Using Cloud SQL means less management overhead compared to installing compute engine directly on compute engine

# Cloud SQL Features
- data replication between zones with failover
- instance cloning
- monitoring and logging
- backups and point in time recovery

# Configurations to keep in mind
- deploy databases in locations close to the services that interact with it
- understand baseline requirements to select the machine type. Do not over spec or under spec
- regions cannot be changed after deployment, but zones can be changed
- failover does not go beyond the region its deployed in, but it does go beyond zones it deployed in
- database storage size cannot be decreased one provisioned. over provisioned of storage causes excess cost. under-provisioning storage means availability issues. the solution  is to enable automatic storage increase setting. in return,  storage is checked every 30 seconds to ensure that storage hasnt fallen a certain threshold. and if it does then additional storage is added