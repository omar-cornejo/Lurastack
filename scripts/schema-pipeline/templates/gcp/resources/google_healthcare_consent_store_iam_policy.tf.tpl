# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_consent_store_iam_policy          │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_consent_store_iam_policy" "this" {

  consent_store_id = ""     # string | required
  dataset          = ""     # string | required
  policy_data      = ""     # string | required
  id               = ""     # string | optional+computed

  # etag             = ""     # string | computed

}

