# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataplex_aspect_type_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
data "google_dataplex_aspect_type_iam_policy" "this" {

  aspect_type_id = ""     # string | required
  id             = ""     # string | optional+computed
  location       = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # etag           = ""     # string | computed
  # policy_data    = ""     # string | computed

}

