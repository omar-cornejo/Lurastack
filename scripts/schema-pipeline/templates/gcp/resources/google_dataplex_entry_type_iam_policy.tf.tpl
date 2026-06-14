# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_entry_type_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_entry_type_iam_policy" "this" {

  entry_type_id = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

