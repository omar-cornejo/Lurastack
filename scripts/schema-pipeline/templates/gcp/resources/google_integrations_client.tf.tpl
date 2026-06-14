# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_integrations_client                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_integrations_client" "this" {

  location                   = ""     # string | required | Location in which client needs to be provisioned.
  create_sample_integrations = false  # bool | optional | Indicates if sample integrations should be created along wit…
  create_sample_workflows    = false  # bool | optional+DEPRECATED | Indicates if sample workflow should be created along with pr…
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional+computed
  provision_gmek             = false  # bool | optional+DEPRECATED | Indicates provision with GMEK or CMEK.
  run_as_service_account     = ""     # string | optional | User input run-as service account, if empty, will bring up a…

  cloud_kms_config { # list [0..1]
    key            = ""     # string | required | A Cloud KMS key is a named object containing one or more key…
    kms_location   = ""     # string | required | Location name of the key ring, e.g. "us-west1".
    kms_ring       = ""     # string | required | A key ring organizes keys in a specific Google Cloud locatio…
    key_version    = ""     # string | optional | Each version of a key contains key material used for encrypt…
    kms_project_id = ""     # string | optional | The Google Cloud project id of the project where the kms key…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

