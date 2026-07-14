# Cloud Spanner

### What is cloud spanner
- used for situations that require horizontal scaling. In simple terms, situations where scaling means you add more instances not upgrade the size of the current insstance
- completly cloud native
- characteristics are globally distributed, strongly consistant, and high performance
- capable of providing up to 10,000 queries per second of reads or 2,000 queries per
second of writes.
- ideal for mission-critical workloads. Its key use cases are from the financial and retail industries.

### Cloud spanner configuration options
#### 1. Multi-regional
- By using this configuration, we will gain reduce downtime to approximately 5 minutes per year, but this configration will cost more.
- By using this configuration users experience low read latency. Allows the database's data to be replicated in multiple zones across multiple regions, allowing us to read data with low latency from locations
- By using this configuration users experience higher write latency. because replicas will be spread across more than one region, our applications will see a small increase in write latency

#### 2. Regional
- By using this configuration, we will gain reduce downtime to approximately 52 minutes per year, which is higher than the multi-regional configuration. This is bad
- Regional instances should be selected if users and services are within the same region.
- offer the lowest latency.
- will contain three read/write replicas that allow us to meet any governance requirements
regarding where our data is located.

### Cloud spanner Node count
- Nodes determine the amount of CPU/RAM and storage resources that are available to our instance
- Each node will provide up to 2 TB of storage, and it is recommended that a minimum of three nodes be used for production environments

### Cloud spanner replication
- First, the underlying system of cloud spanner automatically replicates at the byte level. 
- Second, Cloud Spanner will also replicate data by creating copies (replicas) of the rows that Cloud Spanner organized data into. These copies are then
stored in a different geographic area. One of these replicas is elected to act as the leader
and will be responsible for handling writes

### Cloud spanner replication types
#### READ/WRITE | READ-ONLY | WITNESS

#### READ/WRITE
- will maintain a full copy of data and can become an leader
- only available to single-region instances

#### READ-ONLY
- only supports reads and cannot become a leader
- maintains a full database copy
- only available in multi-region instances

#### WITNESS
- dosent support reads
- dosent maintain a full database copy
- only available in mutli-regional instances


