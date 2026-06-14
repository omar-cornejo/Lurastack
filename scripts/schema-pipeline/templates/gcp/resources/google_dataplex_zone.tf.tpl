# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_zone                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_zone" "this" {

  lake             = ""     # string | required | The lake for the resource
  location         = ""     # string | required | The location for the resource
  name             = ""     # string | required | The name of the zone.
  type             = ""     # string | required | Required. Immutable. The type of the zone. Possible values: …
  description      = ""     # string | optional | Optional. Description of the zone.
  display_name     = ""     # string | optional | Optional. User friendly display name.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Optional. User defined labels for the zone.  **Note**: This …
  project          = ""     # string | optional+computed | The project for the resource

  # asset_status = [  # list(object)
  #   {
  #     active_assets = 0
  #     security_policy_applying_assets = 0
  #     update_time = ""
  #   }
  # ]
  # create_time      = ""     # string | computed | Output only. The time when the zone was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state            = ""     # string | computed | Output only. Current state of the zone. Possible values: STA…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | Output only. System generated globally unique ID for the zon…
  # update_time      = ""     # string | computed | Output only. The time when the zone was last updated.

  discovery_spec { # list [1..1]
    enabled          = false  # bool | required | Required. Whether discovery is enabled.
    exclude_patterns = []     # list(string) | optional | Optional. The list of patterns to apply for selecting data t…
    include_patterns = []     # list(string) | optional | Optional. The list of patterns to apply for selecting data t…
    schedule         = ""     # string | optional+computed | Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron)…

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
    location_type = ""     # string | required | Required. Immutable. The location type of the resources that…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

