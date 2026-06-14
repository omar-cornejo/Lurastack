# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_pubsub_subscription                              │
# └──────────────────────────────────────────────────────────────┘
data "google_pubsub_subscription" "this" {

  name                         = ""     # string | required | Name of the subscription.
  id                           = ""     # string | optional+computed
  project                      = ""     # string | optional

  # ack_deadline_seconds         = 0      # number | computed | This value is the maximum time after a subscriber receives a…
  # bigquery_config = [  # list(object)
  #   {
  #     drop_unknown_fields = false
  #     service_account_email = ""
  #     table = ""
  #     use_table_schema = false
  #     use_topic_schema = false
  #     write_metadata = false
  #   }
  # ]
  # cloud_storage_config = [  # list(object)
  #   {
  #     avro_config = [  # list(object)
  #       {
  #         write_metadata = false
  #       }
  #     ]
  #     bucket = ""
  #     filename_datetime_format = ""
  #     filename_prefix = ""
  #     filename_suffix = ""
  #     max_bytes = 0
  #     max_duration = ""
  #     service_account_email = ""
  #     state = ""
  #   }
  # ]
  # dead_letter_policy = [  # list(object)
  #   {
  #     dead_letter_topic = ""
  #     max_delivery_attempts = 0
  #   }
  # ]
  # effective_labels             = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # enable_exactly_once_delivery = false  # bool | computed | If 'true', Pub/Sub provides the following guarantees for the…
  # enable_message_ordering      = false  # bool | computed | If 'true', messages published with the same orderingKey in P…
  # expiration_policy = [  # list(object)
  #   {
  #     ttl = ""
  #   }
  # ]
  # filter                       = ""     # string | computed | The subscription only delivers the messages that match the f…
  # labels                       = {}     # map(string) | computed | A set of key/value label pairs to assign to this Subscriptio…
  # message_retention_duration   = ""     # string | computed | How long to retain unacknowledged messages in the subscripti…
  # push_config = [  # list(object)
  #   {
  #     attributes = {}  # map(string)
  #     no_wrapper = [  # list(object)
  #       {
  #         write_metadata = false
  #       }
  #     ]
  #     oidc_token = [  # list(object)
  #       {
  #         audience = ""
  #         service_account_email = ""
  #       }
  #     ]
  #     push_endpoint = ""
  #   }
  # ]
  # retain_acked_messages        = false  # bool | computed | Indicates whether to retain acknowledged messages. If 'true'…
  # retry_policy = [  # list(object)
  #   {
  #     maximum_backoff = ""
  #     minimum_backoff = ""
  #   }
  # ]
  # terraform_labels             = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # topic                        = ""     # string | computed | A reference to a Topic resource, of the form projects/{proje…

}

