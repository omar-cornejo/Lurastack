# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_ca_pool_iam_binding                │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_ca_pool_iam_binding" "this" {

  ca_pool  = ""     # string | required
  members  = []     # set(string) | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  location = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

