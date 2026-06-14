# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_datascan_iam_binding                │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_datascan_iam_binding" "this" {

  data_scan_id = ""     # string | required
  members      = []     # set(string) | required
  role         = ""     # string | required
  id           = ""     # string | optional+computed
  location     = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

