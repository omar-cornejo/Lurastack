# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_feature_group                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_feature_group" "this" {

  description      = ""     # string | optional | The description of the FeatureGroup.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | The labels with user-defined metadata to organize your Featu…
  name             = ""     # string | optional | The resource name of the Feature Group.
  project          = ""     # string | optional+computed
  region           = ""     # string | optional | The region of feature group. eg us-central1

  # create_time      = ""     # string | computed | The timestamp of when the FeatureGroup was created in RFC333…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp of when the FeatureGroup was last updated in R…

  big_query { # list [0..1]
    entity_id_columns = []     # list(string) | optional | Columns to construct entityId / row keys. If not provided de…

    big_query_source { # list [1..1]
      input_uri = ""     # string | required | BigQuery URI to a table, up to 2000 characters long. For exa…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

