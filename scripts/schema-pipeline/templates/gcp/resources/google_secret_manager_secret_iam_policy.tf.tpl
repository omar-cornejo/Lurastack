# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secret_manager_secret_iam_policy             │
# └──────────────────────────────────────────────────────────────┘
resource "google_secret_manager_secret_iam_policy" "this" {

  policy_data = ""     # string | required
  secret_id   = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

