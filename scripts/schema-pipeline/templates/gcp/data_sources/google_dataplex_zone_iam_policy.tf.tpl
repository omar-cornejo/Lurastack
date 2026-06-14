# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataplex_zone_iam_policy                         │
# └──────────────────────────────────────────────────────────────┘
data "google_dataplex_zone_iam_policy" "this" {

  dataplex_zone = ""     # string | required
  lake          = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}

