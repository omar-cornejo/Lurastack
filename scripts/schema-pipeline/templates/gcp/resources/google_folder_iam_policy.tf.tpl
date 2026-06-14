# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_folder_iam_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_folder_iam_policy" "this" {

  folder      = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

