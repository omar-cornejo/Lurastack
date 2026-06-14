# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_environment                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_environment" "this" {

  display_name = ""     # string | required | The human-readable name of the environment (unique in an age…
  description  = ""     # string | optional | The human-readable description of the environment. The maxim…
  id           = ""     # string | optional+computed
  parent       = ""     # string | optional | The Agent to create an Environment for. Format: projects/<Pr…

  # name         = ""     # string | computed | The name of the environment.
  # update_time  = ""     # string | computed | Update time of this environment. A timestamp in RFC3339 UTC …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  version_configs { # list [1..*]
    version = ""     # string | required | Format: projects/{{project}}/locations/{{location}}/agents/{…

  }

}

