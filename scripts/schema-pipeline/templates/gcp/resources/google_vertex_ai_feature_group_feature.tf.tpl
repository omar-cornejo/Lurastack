# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_feature_group_feature              │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_feature_group_feature" "this" {

  feature_group       = ""     # string | required | The name of the Feature Group.
  name                = ""     # string | required | The resource name of the Feature Group Feature.
  region              = ""     # string | required | The region for the resource. It should be the same as the fe…
  description         = ""     # string | optional | The description of the FeatureGroup.
  id                  = ""     # string | optional+computed
  labels              = {}     # map(string) | optional | The labels with user-defined metadata to organize your Featu…
  project             = ""     # string | optional+computed
  version_column_name = ""     # string | optional+computed | The name of the BigQuery Table/View column hosting data for …

  # create_time         = ""     # string | computed | The timestamp of when the FeatureGroup was created in RFC333…
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time         = ""     # string | computed | The timestamp of when the FeatureGroup was last updated in R…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

