# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_datascan_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_datascan_iam_policy" "this" {

  data_scan_id = ""     # string | required
  policy_data  = ""     # string | required
  id           = ""     # string | optional+computed
  location     = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

