# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_pubsub_schema_iam_policy                         │
# └──────────────────────────────────────────────────────────────┘
data "google_pubsub_schema_iam_policy" "this" {

  schema      = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

