# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tags_tag_key_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_tags_tag_key_iam_policy" "this" {

  policy_data = ""     # string | required
  tag_key     = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

