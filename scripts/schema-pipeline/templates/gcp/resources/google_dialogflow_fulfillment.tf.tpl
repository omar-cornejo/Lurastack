# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_fulfillment                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_fulfillment" "this" {

  display_name = ""     # string | required | The human-readable name of the fulfillment, unique within th…
  enabled      = false  # bool | optional | Whether fulfillment is enabled.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # name         = ""     # string | computed | The unique identifier of the fulfillment. Format: projects/<…

  features { # list
    type = ""     # string | required | The type of the feature that enabled for fulfillment. * SMAL…

  }

  generic_web_service { # list [0..1]
    uri             = ""     # string | required | The fulfillment URI for receiving POST requests. It must use…
    password        = ""     # string | optional | The password for HTTP Basic authentication.
    request_headers = {}     # map(string) | optional | The HTTP request headers to send together with fulfillment r…
    username        = ""     # string | optional | The user name for HTTP Basic authentication.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

