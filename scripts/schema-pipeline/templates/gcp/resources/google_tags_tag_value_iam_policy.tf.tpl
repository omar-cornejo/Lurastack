# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tags_tag_value_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_tags_tag_value_iam_policy" "this" {

  policy_data = ""     # string | required
  tag_value   = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

