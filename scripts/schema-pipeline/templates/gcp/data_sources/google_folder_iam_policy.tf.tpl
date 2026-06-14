# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_folder_iam_policy                                │
# └──────────────────────────────────────────────────────────────┘
data "google_folder_iam_policy" "this" {

  folder      = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

