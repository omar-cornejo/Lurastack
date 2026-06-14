# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_binary_authorization_attestor_iam_policy     │
# └──────────────────────────────────────────────────────────────┘
resource "google_binary_authorization_attestor_iam_policy" "this" {

  attestor    = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

