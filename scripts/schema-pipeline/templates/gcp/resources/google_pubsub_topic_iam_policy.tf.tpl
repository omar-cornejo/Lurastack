# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_topic_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_topic_iam_policy" "this" {

  policy_data = ""     # string | required
  topic       = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

