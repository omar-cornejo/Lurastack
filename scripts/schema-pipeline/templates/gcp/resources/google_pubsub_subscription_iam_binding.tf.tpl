# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_subscription_iam_binding              │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_subscription_iam_binding" "this" {

  members      = []     # set(string) | required
  role         = ""     # string | required
  subscription = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

