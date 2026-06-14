# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_notification                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_notification" "this" {

  bucket             = ""     # string | required | The name of the bucket.
  payload_format     = ""     # string | required | The desired content of the Payload. One of "JSON_API_V1" or …
  topic              = ""     # string | required | The Cloud Pub/Sub topic to which this subscription publishes…
  custom_attributes  = {}     # map(string) | optional |  A set of key/value attribute pairs to attach to each Cloud …
  event_types        = []     # set(string) | optional | List of event type filters for this notification config. If …
  id                 = ""     # string | optional+computed
  object_name_prefix = ""     # string | optional | Specifies a prefix path filter for this notification config.…

  # notification_id    = ""     # string | computed | The ID of the created notification.
  # self_link          = ""     # string | computed | The URI of the created resource.

}

