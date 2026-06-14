# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_pubsub_topic                                     │
# └──────────────────────────────────────────────────────────────┘
data "google_pubsub_topic" "this" {

  name                           = ""     # string | required | Name of the topic.
  id                             = ""     # string | optional+computed
  project                        = ""     # string | optional

  # effective_labels               = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # ingestion_data_source_settings = [  # list(object)
  #   {
  #     aws_kinesis = [  # list(object)
  #       {
  #         aws_role_arn = ""
  #         consumer_arn = ""
  #         gcp_service_account = ""
  #         stream_arn = ""
  #       }
  #     ]
  #   }
  # ]
  # kms_key_name                   = ""     # string | computed | The resource name of the Cloud KMS CryptoKey to be used to p…
  # labels                         = {}     # map(string) | computed | A set of key/value label pairs to assign to this Topic.   **…
  # message_retention_duration     = ""     # string | computed | Indicates the minimum duration to retain a message after it …
  # message_storage_policy = [  # list(object)
  #   {
  #     allowed_persistence_regions = []  # list(string)
  #   }
  # ]
  # schema_settings = [  # list(object)
  #   {
  #     encoding = ""
  #     schema = ""
  #   }
  # ]
  # terraform_labels               = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

