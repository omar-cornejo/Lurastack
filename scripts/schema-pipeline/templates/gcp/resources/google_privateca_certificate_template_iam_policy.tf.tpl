# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_certificate_template_iam_policy    │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_certificate_template_iam_policy" "this" {

  certificate_template = ""     # string | required
  policy_data          = ""     # string | required
  id                   = ""     # string | optional+computed
  location             = ""     # string | optional+computed
  project              = ""     # string | optional+computed

  # etag                 = ""     # string | computed

}

