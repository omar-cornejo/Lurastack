# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_subscription_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_subscription_iam_policy" "this" {

  policy_data  = ""     # string | required
  subscription = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

