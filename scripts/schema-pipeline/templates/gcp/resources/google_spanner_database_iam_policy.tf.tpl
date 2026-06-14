# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_spanner_database_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_spanner_database_iam_policy" "this" {

  database    = ""     # string | required
  instance    = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

