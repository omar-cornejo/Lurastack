# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_privateca_certificate_template_iam_policy        │
# └──────────────────────────────────────────────────────────────┘
data "google_privateca_certificate_template_iam_policy" "this" {

  certificate_template = ""     # string | required
  id                   = ""     # string | optional+computed
  location             = ""     # string | optional+computed
  project              = ""     # string | optional+computed

  # etag                 = ""     # string | computed
  # policy_data          = ""     # string | computed

}

