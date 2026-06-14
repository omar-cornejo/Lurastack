# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_ca_pool_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_ca_pool_iam_policy" "this" {

  ca_pool     = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

