# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataplex_datascan_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
data "google_dataplex_datascan_iam_policy" "this" {

  data_scan_id = ""     # string | required
  id           = ""     # string | optional+computed
  location     = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed
  # policy_data  = ""     # string | computed

}

