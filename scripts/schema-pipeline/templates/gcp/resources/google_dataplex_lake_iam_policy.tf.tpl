# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_lake_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_lake_iam_policy" "this" {

  lake        = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

