# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tags_tag_key_iam_binding                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_tags_tag_key_iam_binding" "this" {

  members = []     # set(string) | required
  role    = ""     # string | required
  tag_key = ""     # string | required
  id      = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

