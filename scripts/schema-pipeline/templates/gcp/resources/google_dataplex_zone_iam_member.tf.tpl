# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_zone_iam_member                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_zone_iam_member" "this" {

  dataplex_zone = ""     # string | required
  lake          = ""     # string | required
  member        = ""     # string | required
  role          = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

