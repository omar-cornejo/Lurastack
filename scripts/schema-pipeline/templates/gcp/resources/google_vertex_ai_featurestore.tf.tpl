# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_featurestore                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_featurestore" "this" {

  force_destroy    = false  # bool | optional | If set to true, any EntityTypes and Features for this Featur…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | A set of key/value label pairs to assign to this Featurestor…
  name             = ""     # string | optional | The name of the Featurestore. This value may be up to 60 cha…
  project          = ""     # string | optional+computed
  region           = ""     # string | optional+computed | The region of the dataset. eg us-central1

  # create_time      = ""     # string | computed | The timestamp of when the featurestore was created in RFC333…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp of when the featurestore was last updated in R…

  encryption_spec { # list [0..1]
    kms_key_name = ""     # string | required | The Cloud KMS resource identifier of the customer managed en…

  }

  online_serving_config { # list [0..1]
    fixed_node_count = 0      # number | optional | The number of nodes for each cluster. The number of nodes wi…

    scaling { # list [0..1]
      max_node_count = 0      # number | required | The maximum number of nodes to scale up to. Must be greater …
      min_node_count = 0      # number | required | The minimum number of nodes to scale down to. Must be greate…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

