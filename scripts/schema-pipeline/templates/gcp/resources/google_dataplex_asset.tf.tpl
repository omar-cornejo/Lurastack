# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_asset                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_asset" "this" {

  dataplex_zone    = ""     # string | required | The zone for the resource
  lake             = ""     # string | required | The lake for the resource
  location         = ""     # string | required | The location for the resource
  name             = ""     # string | required | The name of the asset.
  description      = ""     # string | optional | Optional. Description of the asset.
  display_name     = ""     # string | optional | Optional. User friendly display name.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Optional. User defined labels for the asset.  **Note**: This…
  project          = ""     # string | optional+computed | The project for the resource

  # create_time      = ""     # string | computed | Output only. The time when the asset was created.
  # discovery_status = [  # list(object)
  #   {
  #     last_run_duration = ""
  #     last_run_time = ""
  #     message = ""
  #     state = ""
  #     stats = [  # list(object)
  #       {
  #         data_items = 0
  #         data_size = 0
  #         filesets = 0
  #         tables = 0
  #       }
  #     ]
  #     update_time = ""
  #   }
  # ]
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # resource_status = [  # list(object)
  #   {
  #     message = ""
  #     state = ""
  #     update_time = ""
  #   }
  # ]
  # security_status = [  # list(object)
  #   {
  #     message = ""
  #     state = ""
  #     update_time = ""
  #   }
  # ]
  # state            = ""     # string | computed | Output only. Current state of the asset. Possible values: ST…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | Output only. System generated globally unique ID for the ass…
  # update_time      = ""     # string | computed | Output only. The time when the asset was last updated.

  discovery_spec { # list [1..1]
    enabled          = false  # bool | required | Required. Whether discovery is enabled.
    exclude_patterns = []     # list(string) | optional | Optional. The list of patterns to apply for selecting data t…
    include_patterns = []     # list(string) | optional | Optional. The list of patterns to apply for selecting data t…
    schedule         = ""     # string | optional | Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron)…

    csv_options { # list [0..1]
      delimiter              = ""     # string | optional | Optional. The delimiter being used to separate values. This …
      disable_type_inference = false  # bool | optional | Optional. Whether to disable the inference of data type for …
      encoding               = ""     # string | optional | Optional. The character encoding of the data. The default is…
      header_rows            = 0      # number | optional | Optional. The number of rows to interpret as header rows tha…

    }

    json_options { # list [0..1]
      disable_type_inference = false  # bool | optional | Optional. Whether to disable the inference of data type for …
      encoding               = ""     # string | optional | Optional. The character encoding of the data. The default is…

    }

  }

  resource_spec { # list [1..1]
    type             = ""     # string | required | Required. Immutable. Type of resource. Possible values: STOR…
    name             = ""     # string | optional | Immutable. Relative name of the cloud resource that contains…
    read_access_mode = ""     # string | optional+computed | Optional. Determines how read permissions are handled for ea…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

