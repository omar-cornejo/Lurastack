# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_secret_manager_secret_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
data "google_secret_manager_secret_iam_policy" "this" {

  secret_id   = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

