# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_tags_tag_key_iam_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_tags_tag_key_iam_policy" "this" {

  tag_key     = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

