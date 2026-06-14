# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_binary_authorization_attestor_iam_binding    │
# └──────────────────────────────────────────────────────────────┘
resource "google_binary_authorization_attestor_iam_binding" "this" {

  attestor = ""     # string | required
  members  = []     # set(string) | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

