# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_service_account_iam_binding                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_service_account_iam_binding" "this" {

  members            = []     # set(string) | required
  role               = ""     # string | required
  service_account_id = ""     # string | required
  id                 = ""     # string | optional+computed

  # etag               = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

