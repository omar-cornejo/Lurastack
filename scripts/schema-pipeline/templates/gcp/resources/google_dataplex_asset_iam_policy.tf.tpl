# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_asset_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_asset_iam_policy" "this" {

  asset         = ""     # string | required
  dataplex_zone = ""     # string | required
  lake          = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

