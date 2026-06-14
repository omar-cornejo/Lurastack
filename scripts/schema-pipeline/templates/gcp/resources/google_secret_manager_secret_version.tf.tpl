# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secret_manager_secret_version                │
# └──────────────────────────────────────────────────────────────┘
resource "google_secret_manager_secret_version" "this" {

  secret                = ""     # string | required | Secret Manager secret resource
  secret_data           = ""     # string | required+sensitive | The secret data. Must be no larger than 64KiB.
  deletion_policy       = ""     # string | optional | The deletion policy for the secret version. Setting 'ABANDON…
  enabled               = false  # bool | optional | The current state of the SecretVersion.
  id                    = ""     # string | optional+computed
  is_secret_data_base64 = false  # bool | optional | If set to 'true', the secret data is expected to be base64-e…

  # create_time           = ""     # string | computed | The time at which the Secret was created.
  # destroy_time          = ""     # string | computed | The time at which the Secret was destroyed. Only present if …
  # name                  = ""     # string | computed | The resource name of the SecretVersion. Format: 'projects/{{…
  # version               = ""     # string | computed | The version of the Secret.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

