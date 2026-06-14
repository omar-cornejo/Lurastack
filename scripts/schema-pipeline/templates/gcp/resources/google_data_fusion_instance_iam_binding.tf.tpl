# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_fusion_instance_iam_binding             │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_fusion_instance_iam_binding" "this" {

  members = []     # set(string) | required
  name    = ""     # string | required
  role    = ""     # string | required
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

