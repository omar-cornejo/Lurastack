# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_identity_group_lookup                      │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_identity_group_lookup" "this" {

  id   = ""     # string | optional+computed

  # name = ""     # string | computed | The [resource name](https://cloud.google.com/apis/design/res…

  group_key { # list [1..1]
    id        = ""     # string | required | The ID of the entity. For Google-managed entities, the id sh…
    namespace = ""     # string | optional | The namespace in which the entity exists. If not specified, …

  }

}

