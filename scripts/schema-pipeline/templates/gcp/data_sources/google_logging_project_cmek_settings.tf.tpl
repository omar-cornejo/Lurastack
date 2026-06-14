# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_logging_project_cmek_settings                    │
# └──────────────────────────────────────────────────────────────┘
data "google_logging_project_cmek_settings" "this" {

  project              = ""     # string | required
  id                   = ""     # string | optional+computed
  kms_key_name         = ""     # string | optional | The resource name for the configured Cloud KMS key. 				KMS …

  # kms_key_version_name = ""     # string | computed | The CryptoKeyVersion resource name for the configured Cloud …
  # name                 = ""     # string | computed | The resource name of the CMEK settings.
  # service_account_id   = ""     # string | computed | The service account associated with a project for which CMEK…

}

