# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_iam_binding                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_iam_binding" "this" {

  instance_name = ""     # string | required
  members       = []     # set(string) | required
  role          = ""     # string | required
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed
  zone          = ""     # string | optional+computed

  # etag          = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

