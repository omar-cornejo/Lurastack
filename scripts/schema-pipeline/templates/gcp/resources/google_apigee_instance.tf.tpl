# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_instance                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_instance" "this" {

  location                 = ""     # string | required | Required. Compute Engine location where the instance resides…
  name                     = ""     # string | required | Resource ID of the instance.
  org_id                   = ""     # string | required | The Apigee Organization associated with the Apigee instance,…
  consumer_accept_list     = []     # list(string) | optional+computed | Optional. Customer accept list represents the list of projec…
  description              = ""     # string | optional | Description of the instance.
  disk_encryption_key_name = ""     # string | optional | Customer Managed Encryption Key (CMEK) used for disk and vol…
  display_name             = ""     # string | optional | Display name of the instance.
  id                       = ""     # string | optional+computed
  ip_range                 = ""     # string | optional | IP range represents the customer-provided CIDR block of leng…
  peering_cidr_range       = ""     # string | optional+computed | The size of the CIDR block range that will be reserved by th…

  # host                     = ""     # string | computed | Output only. Hostname or IP address of the exposed Apigee en…
  # port                     = ""     # string | computed | Output only. Port number of the exposed Apigee endpoint.
  # service_attachment       = ""     # string | computed | Output only. Resource name of the service attachment created…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

