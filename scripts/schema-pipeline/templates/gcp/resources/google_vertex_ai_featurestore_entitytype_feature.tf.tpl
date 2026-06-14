# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_featurestore_entitytype_feature    │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_featurestore_entitytype_feature" "this" {

  entitytype       = ""     # string | required | The name of the Featurestore to use, in the format projects/…
  value_type       = ""     # string | required | Type of Feature value. Immutable. https://cloud.google.com/v…
  description      = ""     # string | optional | Description of the feature.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | A set of key/value label pairs to assign to the feature.   *…
  name             = ""     # string | optional | The name of the feature. The feature can be up to 64 charact…

  # create_time      = ""     # string | computed | The timestamp of when the entity type was created in RFC3339…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # region           = ""     # string | computed | The region of the feature
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp when the entity type was most recently updated…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

