# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_lake                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_lake" "this" {

  location         = ""     # string | required | The location for the resource
  name             = ""     # string | required | The name of the lake.
  description      = ""     # string | optional | Optional. Description of the lake.
  display_name     = ""     # string | optional | Optional. User friendly display name.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Optional. User-defined labels for the lake.  **Note**: This …
  project          = ""     # string | optional+computed | The project for the resource

  # asset_status = [  # list(object)
  #   {
  #     active_assets = 0
  #     security_policy_applying_assets = 0
  #     update_time = ""
  #   }
  # ]
  # create_time      = ""     # string | computed | Output only. The time when the lake was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # metastore_status = [  # list(object)
  #   {
  #     endpoint = ""
  #     message = ""
  #     state = ""
  #     update_time = ""
  #   }
  # ]
  # service_account  = ""     # string | computed | Output only. Service account associated with this lake. This…
  # state            = ""     # string | computed | Output only. Current state of the lake. Possible values: STA…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | Output only. System generated globally unique ID for the lak…
  # update_time      = ""     # string | computed | Output only. The time when the lake was last updated.

  metastore { # list [0..1]
    service = ""     # string | optional | Optional. A relative reference to the Dataproc Metastore (ht…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

