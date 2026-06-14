# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_tags_tag_value_iam_policy                        │
# └──────────────────────────────────────────────────────────────┘
data "google_tags_tag_value_iam_policy" "this" {

  tag_value   = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

