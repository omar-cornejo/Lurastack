# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_linked_dataset                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_linked_dataset" "this" {

  bucket          = ""     # string | required | The bucket to which the linked dataset is attached.
  link_id         = ""     # string | required | The id of the linked dataset.
  description     = ""     # string | optional | Describes this link. The maximum length of the description i…
  id              = ""     # string | optional+computed
  location        = ""     # string | optional+computed | The location of the linked dataset.
  parent          = ""     # string | optional+computed | The parent of the linked dataset.

  # create_time     = ""     # string | computed | Output only. The creation timestamp of the link. A timestamp…
  # lifecycle_state = ""     # string | computed | Output only. The linked dataset lifecycle state.
  # name            = ""     # string | computed | The resource name of the linked dataset. The name can have u…

  bigquery_dataset { # list

    # dataset_id = ""     # string | computed | Output only. The full resource name of the BigQuery dataset.…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

