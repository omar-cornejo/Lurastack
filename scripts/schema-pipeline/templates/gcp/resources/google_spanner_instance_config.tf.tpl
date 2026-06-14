# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_spanner_instance_config                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_spanner_instance_config" "this" {

  display_name     = ""     # string | required | The name of this instance configuration as it appears in UIs…
  base_config      = ""     # string | optional+computed | Base configuration name, e.g. nam3, based on which this conf…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | An object containing a list of "key": value pairs. Example: …
  name             = ""     # string | optional+computed | A unique identifier for the instance configuration. Values a…
  project          = ""     # string | optional+computed

  # config_type      = ""     # string | computed | Output only. Whether this instance config is a Google or Use…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  replicas { # set [1..*]
    default_leader_location = false  # bool | optional | If true, this location is designated as the default leader l…
    location                = ""     # string | optional | The location of the serving resources, e.g. "us-central1".
    type                    = ""     # string | optional | Indicates the type of replica.  See the [replica types docum…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

