# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_ml_engine_model                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_ml_engine_model" "this" {

  name                              = ""     # string | required | The name specified for the model.
  description                       = ""     # string | optional | The description specified for the model when it was created.
  id                                = ""     # string | optional+computed
  labels                            = {}     # map(string) | optional | One or more labels that you can add, to organize your models…
  online_prediction_console_logging = false  # bool | optional | If true, online prediction nodes send stderr and stdout stre…
  online_prediction_logging         = false  # bool | optional | If true, online prediction access logs are sent to StackDriv…
  project                           = ""     # string | optional+computed
  regions                           = []     # list(string) | optional | The list of regions where the model is going to be deployed.…

  # effective_labels                  = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels                  = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  default_version { # list [0..1]
    name = ""     # string | required | The name specified for the version when it was created.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

