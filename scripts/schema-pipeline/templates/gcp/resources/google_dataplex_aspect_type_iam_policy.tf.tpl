# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_aspect_type_iam_policy              │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_aspect_type_iam_policy" "this" {

  aspect_type_id = ""     # string | required
  policy_data    = ""     # string | required
  id             = ""     # string | optional+computed
  location       = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # etag           = ""     # string | computed

}

