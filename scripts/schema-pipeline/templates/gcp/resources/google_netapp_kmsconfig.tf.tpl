# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_netapp_kmsconfig                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_netapp_kmsconfig" "this" {

  crypto_key_name  = ""     # string | required | Resource name of the KMS key to use. Only regional keys are …
  location         = ""     # string | required | Name of the policy location. CMEK policies apply to the whol…
  name             = ""     # string | required | Name of the CMEK policy.
  description      = ""     # string | optional | Description for the CMEK policy.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels as key value pairs. Example: '{ "owner": "Bob", "depa…
  project          = ""     # string | optional+computed

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # instructions     = ""     # string | computed | Access to the key needs to be granted. The instructions cont…
  # service_account  = ""     # string | computed | The Service account which needs to have access to the  provi…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

