# Creating Cloud SQL
1. Go to the navigation menu and go to `Cloud SQL`
1. Click `instances`
1. Click `Create free instance`
1. Click `New Instance`
1. Select the database engine you require. In this case, select MySQL
1. Enter an username and password
1. To further customize the instance un-select `data protection` tab > select `prevent  instance deletion` 
1. Choose region and zonal availability
1. To further customize the instance select `Customize your instance`
1. Go to `Connections` > `Instance IP assignment`
1. Click `Private IP`
1. Click `Allocated IP range`

# End Result
![End-Result](../Screenshots/2026-05-20.png)

# Creating VM
1. Go to the navigation menu and go to `Cloud SQL`
1. Click `instances`
1. Select same region as Cloud SQL Instance
1. Frewalls Select `Allow HTTP traffic`
1. Click `Create`

# Adding the VM IP as an Authorized Network
1. Click `connections`
1. Navigate to `Networking Tab`
1. Click `Add Network`
1. Add name
1. Add external IP of virtual machine

# Installing SQL client on VM
1. In Compute Engine, go to the VM instances page
1. Click connect
1. Click `SSH`

# Connecting to Cloud SQL
1. to install sql client instance, run
```
sudo apt-get update
sudo apt-get install default-mysql-server
```

1. Enter the following in your VM's terminal, replacing INSTANCE_IP with the public IP address of your MySQL instance and USERNAME with the appropriate username (default: root):

```
mysql -h INSTANCE_IP -u USERNAME -p
```

# Navigating Databases Within VM
1. Enter the following in your VM to view databases
```
SHOW DATABASES;
```
1. Enter the following in your VM to create an database
```
CREATE DATABASE database_name;
```

1. Enter the following in your VM to use an database table
```
USE database_name; 
```

1. Enter the following in your VM to create an database table
```
CREATE TABLE table_name (
  column1 datatype constraint,
  column2 datatype constraint,
  column3 datatype constraint,
  ....
);
```
```
CREATE TABLE Persons (
  PersonID int ,
  hire_date DATE,
  LastName varchar(50) NOT NULL,
  FirstName varchar(50),
  Address varchar(255),
  City varchar(255)
);
```

1. Enter the following in your VM to select an database table
```
SELECT * FROM table_name
```

1. Enter the following in your VM to insert values into an database table
```
INSERT INTO table_name
VALUES ();
```

1. Enter the following in your VM to insert values into an database table for multiple rows
```
INSERT INTO table_name
VALUES (),
       (),
       ();
;
```

1. Enter the following in your VM to select all values from an database table 
```
Select * 
FROM table_name
```

1. Enter the following in your VM to select SPECIFIC values from an database table 
```
Select * 
FROM table_name
WHERE row = value;
```


### Documentation Used

For this assignment, I only used the official documentation provided in the homework, along with the Google Cloud Terraform Registry documentation for the Google provider and Compute Engine resources.

## Connecting to Cloud SQL
[Connecting to Cloud SQL](https://docs.cloud.google.com/sdk/gcloud/reference/sql/connect)

This source was used to write instructions to connect to Cloud SQL

## Creating a Database
[Creating a Database](https://youtu.be/9LQ9rGoGfYQ?si=NfXgGlLfIMvqOMbK)

\< WHY SOURCE WAS USED\>  

## Creating a Table
[Creating a Table](https://youtu.be/XfrgCK6BX5w?si=JVuu-wDAeir-Eu2F)

\< WHY SOURCE WAS USED\>

## Insert into a Table
[Insert into a Table](https://youtu.be/Cxilfg-M158?si=EKlQj00ryuBzxgNV)

\< WHY SOURCE WAS USED\>  

## Select from a Table
[Select from a Table](https://youtu.be/kUDznItqKbI?si=8CcDqwj-O3R7dVPl)

\< WHY SOURCE WAS USED\>  

## Update and Delete from Table
[Update and Delete from Table](https://youtu.be/OB2leB2iZ6U?si=lotrS4RVixtGkcxQ)

\< WHY SOURCE WAS USED\> 

## Title
[Connecting to Cloud SQL](https://docs.cloud.google.com/sdk/gcloud/reference/sql/connect)

\< WHY SOURCE WAS USED\> 

### Enginerring Notes
1. By default the Database Instance uses a production grade configuration. If an developmental configuration is required, do not use default settings. First, select enterprise edition. Then, edition preset is sandbox

For example, an production grade database with the highest settings is 2.30$ per hour. In other words, the cost to run the database will be 30$ if left running for 24 hours. 

Second, an sandbox grade database instance with the lowest settings will cost .14 cents per hour to run. If this workload ran for 24 hours total cost would be less than 5$.

In conclusion, pay attention to the `pricing estimate` tab when configuring workloads

2. Also monitor the pricing when configuring an Compute engine instance. an `e2-micro` instance costs 0.01 hourly to run. In simple terms is 0.24 to run for a day

3. Adding an authorized network is what allows  our VM to access the SQL instancee