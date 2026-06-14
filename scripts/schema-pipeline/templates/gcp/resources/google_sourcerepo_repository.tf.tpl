# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_sourcerepo_repository                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_sourcerepo_repository" "this" {

  name    = ""     # string | required | Resource name of the repository, of the form '{{repo}}'. The…
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  # size    = 0      # number | computed | The disk usage of the repo, in bytes.
  # url     = ""     # string | computed | URL to clone the repository from Google Cloud Source Reposit…

  pubsub_configs { # set
    message_format        = ""     # string | required | The format of the Cloud Pub/Sub messages. - PROTOBUF: The me…
    topic                 = ""     # string | required
    service_account_email = ""     # string | optional+computed | Email address of the service account used for publishing Clo…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

