O-auth file <br>
This is the first file <br>

the following code block communncates with terrafrom to incdicate how to communicate with the cloud envionrment, and what version of terraform to install
```
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" 
    }
  }
}

provider "google" {
  project = "class-seven-point"
  region  = "us-east4"
}
```

##### CREATING BUCKET
##2. Enter an name for the Google Storage bucket `static-website-01`
##3. Location type selected Multi-Region
##4. Storage class is standard
##5. For prevent public access unchecked `Enforce public access prevention on this bucket` 
##6. Clicked create

resource "google_storage_bucket" "static-website-01" {
  name          = "static-website-01"
  location      = "US"
  ##public_access_prevention = ""
  website {
    main_page_suffix = "index.html"
    not_found_page = "404.html"
  }
}

1. Creating the bucket with the following code does not mean the files are in the bucket. Only means that bucket website configuration has been made. which means the bucket knows what files to use as website code. does not mean the bucket has the code files in it <br>
2. To vertify that the bucket was created navigated into the GUI
```
website {
    main_page_suffix = "index.html"
    not_found_page = "404.html"
  }
```

to upload an object into google cloud storage you need to use another code block `google_storage_bucket_object` <br>

when attempted to run the configuration to add files into this error <br>
the error occured because dots `.` and `404` cannot be an resource name. so, `index.html` and `404.html` caused the error <br>
```
rahdejonesrahde@rahdes-MacBook-Pro Terraform % terraform plan 
╷
│ Error: Invalid resource name
│ 
│   on 2-storage.tf line 26, in resource "google_storage_bucket_object" "index.html":
│   26: resource "google_storage_bucket_object" "index.html" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
╵
╷
│ Error: Invalid resource name
│ 
│   on 2-storage.tf line 34, in resource "google_storage_bucket_object" "404.html":
│   34: resource "google_storage_bucket_object" "404.html" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
```

when used terraform apply to add resources to the bucket got the following error <br>
solution use full path <br>
```
│ Error: open ~/Terraform/Website/index.html: no such file or directory
│ 
│   with google_storage_bucket_object.index,
│   on 2-storage.tf line 26, in resource "google_storage_bucket_object" "index":
│   26: resource "google_storage_bucket_object" "index" {
│ 
╵
╷
│ Error: open ~/Terraform/Website/404.html: no such file or directory
│ 
│   with google_storage_bucket_object.error,
│   on 2-storage.tf line 34, in resource "google_storage_bucket_object" "error":
│   34: resource "google_storage_bucket_object" "error" {
```
to vertify that the objects placed into the bucket. create an output where the public URL is the output 

Questions <br>
how do you upload an file to an google storage bucket if your using terraform <br>

what does `public_access_prevention` do <br>
what are memembers and what are member types <br>

ran into the following error when attempting to do terraform apply after attempting to create permission <br>
error occured becasue of this syntax error `member  = "allUsers"`, changed the syntax to `member  = "user:allUsers"` <br>
The error PROJECT_SET_IAM_DISALLOWED_MEMBER_TYPE means that you cannot add allUsers as a member at the Project level.

While the error text says members must be prefixed with user:, group:, etc., it’s actually failing because Google Cloud blocks public access (allUsers) from being applied to an entire project via the Resource Manager API. This is a safety feature to prevent you from accidentally making your entire infrastructure public <br>
solution, use `google_storage_bucket_iam_member` resource block to aplly permisisons on. the bucket lebel rather than the project level
```
Request `Create IAM Members roles/storage.viewer allUsers for project "class-seven-point"` returned error: Error applying IAM policy for project "class-seven-point": Error setting IAM policy for project "class-seven-point": googleapi: Error 400: Policy members must be of the form "<type>:<value>".
│ Details:
│ [
│   {
│     "@type": "type.googleapis.com/google.rpc.BadRequest",
│     "fieldViolations": [
│       {
│         "description": "Policy members must be prefixed of the form '\u003ctype\u003e:\u003cvalue\u003e', where \u003ctype\u003e is 'domain', 'group', 'serviceAccount', or 'user'.",
│         "field": "policy.bindings.member"
│       }
│     ]
│   },
│   {
│     "@type": "type.googleapis.com/google.rpc.ErrorInfo",
│     "domain": "cloudresourcemanager.googleapis.com",
│     "reason": "PROJECT_SET_IAM_DISALLOWED_MEMBER_TYPE"
│   },
│   {
│     "@type": "type.googleapis.com/google.rpc.ResourceInfo",
│     "resourceName": "projects/class-seven-point"
│   }
│ ]
│ , badRequest
│ 
│   with google_project_iam_member.class-seven-point,
│   on 1-storage.tf line 49, in resource "google_project_iam_member" "class-seven-point":
│   49: resource "google_project_iam_member" "class-seven-point" {
│ 
╵
```

# ENGINEERING REFLECTION
This is a great breakdown of the troubleshooting process. You’ve encountered three of the most common "gotchas" in Terraform and GCP: **naming constraints**, **pathing issues**, and **IAM scope**.



Here are engineering reflection questions tailored to your specific experience with this lab, followed by the technical answers to your questions.

---

## Engineering Reflection Questions

### 1. Provider & Authentication (The "0-Auth" File)
* **Step Reflection:** Why is it better to specify a `version` in the `required_providers` block (e.g., `~> 5.0`) rather than leaving it blank?
* **Production Context:** In a team environment, how do we ensure every engineer is using the exact same version of the Google provider to avoid "state drift"?

### 2. Resource Naming & Pathing
* **Design Decision:** Terraform resource names (the string after the resource type) are internal identifiers. Why does Terraform forbid dots (`.`) or starting with numbers in these names, even if the actual GCP resource allows them?
* **Production Context:** When using the `source` attribute for a `google_storage_bucket_object`, why is using a relative path (like `./Website/index.html`) often preferred over an absolute path (like `/Users/rahde/...`) when working in a CI/CD pipeline?

### 3. Storage & Public Access
* **Step Reflection:** You checked "Multi-Region" for the bucket. How does this impact the **Availability** and **Latency** of your static website compared to a "Regional" bucket?
* **Design Decision:** Why did the lab have you uncheck `Enforce public access prevention`? What would happen to your website's accessibility if that remained checked?
* **Production Context:** If this website contained sensitive internal documentation, how would you change the IAM member from `allUsers` to ensure only company employees could see it?

---

## Technical Deep Dive

### How do you upload a file to a GCS bucket using Terraform?
To upload a file, you use the `google_storage_bucket_object` resource. The key is distinguishing between the **name** (what the file is called in the bucket) and the **source** (where the file lives on your computer).

```hcl
resource "google_storage_bucket_object" "index_page" {
  name   = "index.html"                          # The name inside the bucket
  bucket = google_storage_bucket.static-website-01.name
  source = "${path.module}/Website/index.html"   # The local path to the file
}
```
*Note: Using `${path.module}` makes your code portable, so it works on any computer without needing the full path.*

### What does `public_access_prevention` do?
This is a bucket-level "master switch." 
* **Enforced:** Even if you grant `allUsers` permissions via IAM, Google will block all public access. This is a safety layer to prevent data leaks.
* **Inherited:** The bucket follows the organization's default policy (usually "Enforced" in professional settings).
* For a **public website**, this must be set to `inherited` or "uncheck the enforcement" so that your IAM policies can actually take effect.

### What are Members and Member Types?
In GCP IAM, a **Member** is the "Who." The **Member Type** is the prefix that tells Google what kind of identity it is.

| Member Type | Example | Use Case |
| :--- | :--- | :--- |
| **user:** | `user:rahde@example.com` | Individual people with Google accounts. |
| **serviceAccount:** | `serviceAccount:terraform-sa@project.iam.gserviceaccount.com` | Applications or scripts (like Terraform). |
| **group:** | `group:admins@example.com` | A Google Group containing multiple users. |
| **domain:** | `domain:example.com` | Anyone with an account in a specific Workspace. |
| **special:** | `allUsers` | **Anyone on the internet** (no login required). |

### The `PROJECT_SET_IAM_DISALLOWED_MEMBER_TYPE` Error
You correctly identified that applying `allUsers` at the **Project level** is blocked. 
* **The "Why":** If you granted `roles/storage.viewer` to `allUsers` at the Project level, every single bucket in your project—even ones containing private database backups or logs—would become public.
* **The Fix:** Always apply public permissions at the **Bucket level** using `google_storage_bucket_iam_member`. This limits the "blast radius" to only the specific bucket meant for the website.

How are you planning to handle the "VidiStream" disaster recovery lab—will you be using a similar public bucket strategy for the video files?