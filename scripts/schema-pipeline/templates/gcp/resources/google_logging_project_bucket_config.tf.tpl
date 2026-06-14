# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_project_bucket_config                │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_project_bucket_config" "this" {

  bucket_id        = ""     # string | required | The name of the logging bucket. Logging automatically create…
  location         = ""     # string | required | The location of the bucket.
  project          = ""     # string | required | The parent project that contains the logging bucket.
  description      = ""     # string | optional+computed | An optional description for this bucket.
  enable_analytics = false  # bool | optional | Enable log analytics for the bucket. Cannot be disabled once…
  id               = ""     # string | optional+computed
  locked           = false  # bool | optional | Whether the bucket is locked. The retention period on a lock…
  retention_days   = 0      # number | optional | Logs will be retained by default for this amount of time, af…

  # lifecycle_state  = ""     # string | computed | The bucket's lifecycle such as active or deleted.
  # name             = ""     # string | computed | The resource name of the bucket

  cmek_settings { # list [0..1]
    kms_key_name         = ""     # string | required | The resource name for the configured Cloud KMS key. KMS key …

    # kms_key_version_name = ""     # string | computed | The CryptoKeyVersion resource name for the configured Cloud …
    # name                 = ""     # string | computed | The resource name of the CMEK settings.
    # service_account_id   = ""     # string | computed | The service account associated with a project for which CMEK…

  }

  index_configs { # set [0..20]
    field_path = ""     # string | required | The LogEntry field path to index.
    type       = ""     # string | required | The type of data in this index Note that some paths are auto…

  }

}

