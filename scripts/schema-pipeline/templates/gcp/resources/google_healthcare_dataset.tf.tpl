# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_dataset                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_dataset" "this" {

  location  = ""     # string | required | The location for the Dataset.
  name      = ""     # string | required | The resource name for the Dataset.
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed
  time_zone = ""     # string | optional+computed | The default timezone used by this dataset. Must be a either …

  # self_link = ""     # string | computed | The fully qualified name of this dataset

  encryption_spec { # list [0..1]
    kms_key_name = ""     # string | optional | KMS encryption key that is used to secure this dataset and i…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

