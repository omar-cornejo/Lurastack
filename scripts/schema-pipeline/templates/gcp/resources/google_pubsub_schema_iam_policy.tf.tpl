# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_schema_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_schema_iam_policy" "this" {

  policy_data = ""     # string | required
  schema      = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

