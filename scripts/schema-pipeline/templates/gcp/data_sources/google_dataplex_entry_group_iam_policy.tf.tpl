# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataplex_entry_group_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
data "google_dataplex_entry_group_iam_policy" "this" {

  entry_group_id = ""     # string | required
  id             = ""     # string | optional+computed
  location       = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # etag           = ""     # string | computed
  # policy_data    = ""     # string | computed

}

