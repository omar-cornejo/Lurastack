# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_tensorboard                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_tensorboard" "this" {

  display_name             = ""     # string | required | User provided name of this Tensorboard.
  description              = ""     # string | optional | Description of this Tensorboard.
  id                       = ""     # string | optional+computed
  labels                   = {}     # map(string) | optional | The labels with user-defined metadata to organize your Tenso…
  project                  = ""     # string | optional+computed
  region                   = ""     # string | optional+computed | The region of the tensorboard. eg us-central1

  # blob_storage_path_prefix = ""     # string | computed | Consumer project Cloud Storage path prefix used to store blo…
  # create_time              = ""     # string | computed | The timestamp of when the Tensorboard was created in RFC3339…
  # effective_labels         = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                     = ""     # string | computed | Name of the Tensorboard.
  # run_count                = ""     # string | computed | The number of Runs stored in this Tensorboard.
  # terraform_labels         = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time              = ""     # string | computed | The timestamp of when the Tensorboard was last updated in RF…

  encryption_spec { # list [0..1]
    kms_key_name = ""     # string | required | The Cloud KMS resource identifier of the customer managed en…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

