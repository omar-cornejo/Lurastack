# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_consent_store_iam_member          │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_consent_store_iam_member" "this" {

  consent_store_id = ""     # string | required
  dataset          = ""     # string | required
  member           = ""     # string | required
  role             = ""     # string | required
  id               = ""     # string | optional+computed

  # etag             = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

