# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_logging_project_settings                         │
# └──────────────────────────────────────────────────────────────┘
data "google_logging_project_settings" "this" {

  project                    = ""     # string | required | The project for which to retrieve settings.
  id                         = ""     # string | optional+computed

  # disable_default_sink       = false  # bool | computed | If set to true, the _Default sink in newly created projects …
  # kms_key_name               = ""     # string | computed | The resource name for the configured Cloud KMS key. 				KMS …
  # kms_service_account_id     = ""     # string | computed | The service account associated with a project for which CMEK…
  # logging_service_account_id = ""     # string | computed | The service account for the given container. Sinks use this …
  # name                       = ""     # string | computed | The resource name of the CMEK settings.
  # storage_location           = ""     # string | computed | The storage location that Cloud Logging will use to create n…

}

