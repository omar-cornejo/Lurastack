# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_web_iam_policy                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_web_iam_policy" "this" {

  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

