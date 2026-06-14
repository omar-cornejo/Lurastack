# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_pubsub_subscription_iam_policy                   │
# └──────────────────────────────────────────────────────────────┘
data "google_pubsub_subscription_iam_policy" "this" {

  subscription = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed
  # policy_data  = ""     # string | computed

}

