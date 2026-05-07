## Provider Block
- Provider Terraform block is used to connect Terraform to target Google Cloud account
- Enter values for project and region
- The values for project and regin attribute are stored as variables make changing values easier


```
provider "google" {
  # Provider Terraform block is used to connect Terraform to target Google Cloud account
  # Enter values for project and region

  # project = "class-seven-point"
  # region  = "us-central1"
}
```

```
variable  

```

## Creating VM
- to locate `“centOS stream 10” OS image` created an VM through the GUI sand navigated to OS and Storage 
- click change image
- click on equviliant cofr

## ERROR 1
1. when attempting to add an second interface for the purpose of adding an external IP into google cloud compute instance ran into this error <br>

```
Error creating instance: googleapi: Error 400: Invalid value for field 'resource.networkInterfaces[1].subnetwork': ''. Subnetworks must be distinct for NICs attached to a VM., invalid
│ 
│   with google_compute_instance.dev-instance,
│   on 2-compute.tf line 4, in resource "google_compute_instance" "dev-instance":
│    4: resource "google_compute_instance" "dev-instance" {
```


2. proposed solution create another subnet because of this message `Subnetworks must be distinct for NICs attached to a VM`
```
subnetwork - (Optional) The name or self_link of the subnetwork to attach this interface to. Either network or subnetwork must be provided. If network isn't provided it will be inferred from the subnetwork. The subnetwork must exist in the same region this instance will be created in. If the network resource is in legacy mode, do not specify this field. If the network is in auto subnet mode, specifying the subnetwork is optional. If the network is in custom subnet mode, specifying the subnetwork is required.
```

3. how to add another subnet 


## ERROR 2
1. When attempting to create an firewall rule . ran into this error
```
│ Error: Reference to undeclared resource
│ 
│   on 1-firewall.tf line 3, in resource "google_compute_firewall" "allow-http":
│    3:  network = google_compute_network.default.name
│ 
│ A managed resource "google_compute_network" "default" has not been declared in the root module.
```
2.solution use source_ranges = ["0.0.0.0/0"]