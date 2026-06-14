# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_lake_iam_member                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_lake_iam_member" "this" {

  lake     = ""     # string | required
  member   = ""     # string | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  location = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

