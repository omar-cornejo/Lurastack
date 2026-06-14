# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_folder_settings                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_folder_settings" "this" {

  folder                     = ""     # string | required | The folder for which to retrieve settings.
  disable_default_sink       = false  # bool | optional+computed | If set to true, the _Default sink in newly created projects …
  id                         = ""     # string | optional+computed
  kms_key_name               = ""     # string | optional+computed | The resource name for the configured Cloud KMS key.
  storage_location           = ""     # string | optional+computed | The storage location that Cloud Logging will use to create n…

  # kms_service_account_id     = ""     # string | computed | The service account that will be used by the Log Router to a…
  # logging_service_account_id = ""     # string | computed | The service account for the given container. Sinks use this …
  # name                       = ""     # string | computed | The resource name of the settings.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

