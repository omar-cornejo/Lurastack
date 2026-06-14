# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_healthcare_consent_store_iam_policy              │
# └──────────────────────────────────────────────────────────────┘
data "google_healthcare_consent_store_iam_policy" "this" {

  consent_store_id = ""     # string | required
  dataset          = ""     # string | required
  id               = ""     # string | optional+computed

  # etag             = ""     # string | computed
  # policy_data      = ""     # string | computed

}

