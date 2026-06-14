# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_webhook                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_webhook" "this" {

  display_name               = ""     # string | required | The human-readable name of the webhook, unique within the ag…
  disabled                   = false  # bool | optional | Indicates whether the webhook is disabled.
  enable_spell_correction    = false  # bool | optional | Indicates if automatic spell correction is enabled in detect…
  enable_stackdriver_logging = false  # bool | optional | Determines whether this agent should log conversation querie…
  id                         = ""     # string | optional+computed
  parent                     = ""     # string | optional | The agent to create a webhook for. Format: projects/<Project…
  security_settings          = ""     # string | optional | Name of the SecuritySettings reference for the agent. Format…
  timeout                    = ""     # string | optional | Webhook execution timeout.

  # name                       = ""     # string | computed | The unique identifier of the webhook. Format: projects/<Proj…
  # start_flow                 = ""     # string | computed | Name of the start flow in this agent. A start flow will be a…

  generic_web_service { # list [0..1]
    uri              = ""     # string | required | Whether to use speech adaptation for speech recognition.
    allowed_ca_certs = []     # list(string) | optional | Specifies a list of allowed custom CA certificates (in DER f…
    request_headers  = {}     # map(string) | optional | The HTTP request headers to send together with webhook reque…

  }

  service_directory { # list [0..1]
    service = ""     # string | required | The name of Service Directory service.

    generic_web_service { # list [1..1]
      uri              = ""     # string | required | Whether to use speech adaptation for speech recognition.
      allowed_ca_certs = []     # list(string) | optional | Specifies a list of allowed custom CA certificates (in DER f…
      request_headers  = {}     # map(string) | optional | The HTTP request headers to send together with webhook reque…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

