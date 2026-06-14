# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataplex_lake_iam_policy                         │
# └──────────────────────────────────────────────────────────────┘
data "google_dataplex_lake_iam_policy" "this" {

  lake        = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

