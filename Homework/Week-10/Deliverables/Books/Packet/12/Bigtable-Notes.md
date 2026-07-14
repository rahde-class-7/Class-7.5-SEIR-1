# Creating Bigtable

### What is Bigtable
- GCP's big data NoSQL database service
- low latency and can scale to billions of rows and thousands of columns
- a great choice for analytics and real-time workloads as it's designed to handle massive workloads at low latency and high throughput
- Bigtable should not be used for transaction support

### Bigtable configuration
the following are key components of bigtable
Instances | Clusters | Nodes | Schema | Replication

### Bigtable configuration: Instances
- cloud bigtable is made up of instances. These instances contain up to 4 clusters. applications connect to these clusters
- in simple terms, an big table instance is a container for clusters and nodes

### Bigtable configuration: Clusters
- an cluster represents the services in a specific location
- view clusters as items that exist within a Bigtable instance
- two clusters cannot exist within the same zone. clusters exist one per zone
- replication occurs by storing data in each cluster zone

### Bigtable configuration: Nodes
in a production configuration, each instance contains 3 nodes
- data is stored across nodes, and data is stored across nodes
- as Bigtable get stressed more nodes are added to reduce the load

### Bigtable configuration: Schema
### Bigtable configuration: Replication