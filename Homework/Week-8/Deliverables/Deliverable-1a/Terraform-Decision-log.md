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