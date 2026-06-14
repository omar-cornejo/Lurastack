# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_certificate_template_iam_member    │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_certificate_template_iam_member" "this" {

  certificate_template = ""     # string | required
  member               = ""     # string | required
  role                 = ""     # string | required
  id                   = ""     # string | optional+computed
  location             = ""     # string | optional+computed
  project              = ""     # string | optional+computed

  # etag                 = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

