# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_binary_authorization_attestor_iam_policy         │
# └──────────────────────────────────────────────────────────────┘
data "google_binary_authorization_attestor_iam_policy" "this" {

  attestor    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

