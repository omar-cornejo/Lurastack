# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_folder_notification_config               │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_folder_notification_config" "this" {

  config_id       = ""     # string | required | This must be unique within the organization.
  folder          = ""     # string | required | Numerical ID of the parent folder.
  pubsub_topic    = ""     # string | required | The Pub/Sub topic to send notifications to. Its format is "p…
  description     = ""     # string | optional | The description of the notification config (max of 1024 char…
  id              = ""     # string | optional+computed

  # name            = ""     # string | computed | The resource name of this notification config, in the format…
  # service_account = ""     # string | computed | The service account that needs "pubsub.topics.publish" permi…

  streaming_config { # list [1..1]
    filter = ""     # string | required | Expression that defines the filter to apply across create/up…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

