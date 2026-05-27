# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_topic                                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_topic" "this" {

  name                       = ""     # string | required | Name of the topic.
  id                         = ""     # string | optional+computed
  kms_key_name               = ""     # string | optional | The resource name of the Cloud KMS CryptoKey to be used to p…
  labels                     = {}     # map(string) | optional | A set of key/value label pairs to assign to this Topic.   **…
  message_retention_duration = ""     # string | optional | Indicates the minimum duration to retain a message after it …
  project                    = ""     # string | optional+computed

  # effective_labels           = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels           = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  ingestion_data_source_settings { # list [0..1]

    aws_kinesis { # list [0..1]
      aws_role_arn        = ""     # string | required | AWS role ARN to be used for Federated Identity authenticatio…
      consumer_arn        = ""     # string | required | The Kinesis consumer ARN to used for ingestion in Enhanced F…
      gcp_service_account = ""     # string | required | The GCP service account to be used for Federated Identity au…
      stream_arn          = ""     # string | required | The Kinesis stream ARN to ingest data from.

    }

  }

  message_storage_policy { # list [0..1]
    allowed_persistence_regions = []     # list(string) | required | A list of IDs of GCP regions where messages that are publish…

  }

  schema_settings { # list [0..1]
    schema   = ""     # string | required | The name of the schema that messages published should be val…
    encoding = ""     # string | optional | The encoding of messages validated against schema. Default v…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

