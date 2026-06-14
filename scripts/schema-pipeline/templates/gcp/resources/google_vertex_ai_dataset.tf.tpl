# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_dataset                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_dataset" "this" {

  display_name        = ""     # string | required | The user-defined name of the Dataset. The name can be up to …
  metadata_schema_uri = ""     # string | required | Points to a YAML file stored on Google Cloud Storage describ…
  id                  = ""     # string | optional+computed
  labels              = {}     # map(string) | optional | A set of key/value label pairs to assign to this Workflow.  …
  project             = ""     # string | optional+computed
  region              = ""     # string | optional+computed | The region of the dataset. eg us-central1

  # create_time         = ""     # string | computed | The timestamp of when the dataset was created in RFC3339 UTC…
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                = ""     # string | computed | The resource name of the Dataset. This value is set by Googl…
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time         = ""     # string | computed | The timestamp of when the dataset was last updated in RFC333…

  encryption_spec { # list [0..1]
    kms_key_name = ""     # string | optional | Required. The Cloud KMS resource identifier of the customer …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

