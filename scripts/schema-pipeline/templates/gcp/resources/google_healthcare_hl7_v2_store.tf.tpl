# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_hl7_v2_store                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_hl7_v2_store" "this" {

  dataset                  = ""     # string | required | Identifies the dataset addressed by this request. Must be in…
  name                     = ""     # string | required | The resource name for the Hl7V2Store.  ** Changing this prop…
  id                       = ""     # string | optional+computed
  labels                   = {}     # map(string) | optional | User-supplied key-value pairs used to organize HL7v2 stores.…
  reject_duplicate_message = false  # bool | optional | Determines whether duplicate messages are allowed.

  # effective_labels         = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # self_link                = ""     # string | computed | The fully qualified name of this dataset
  # terraform_labels         = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  notification_config { # list [0..1]
    pubsub_topic = ""     # string | required | The Cloud Pub/Sub topic that notifications of changes are pu…

  }

  notification_configs { # list
    pubsub_topic = ""     # string | required | The Cloud Pub/Sub topic that notifications of changes are pu…
    filter       = ""     # string | optional | Restricts notifications sent for messages matching a filter.…

  }

  parser_config { # list [0..1]
    allow_null_header  = false  # bool | optional | Determines whether messages with no header are allowed.
    schema             = ""     # string | optional | JSON encoded string for schemas used to parse messages in th…
    segment_terminator = ""     # string | optional | Byte(s) to be used as the segment terminator. If this is uns…
    version            = ""     # string | optional | The version of the unschematized parser to be used when a cu…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

