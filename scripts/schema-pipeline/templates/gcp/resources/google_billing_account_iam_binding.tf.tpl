# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_billing_account_iam_binding                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_billing_account_iam_binding" "this" {

  billing_account_id = ""     # string | required
  members            = []     # set(string) | required
  role               = ""     # string | required
  id                 = ""     # string | optional+computed

  # etag               = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

