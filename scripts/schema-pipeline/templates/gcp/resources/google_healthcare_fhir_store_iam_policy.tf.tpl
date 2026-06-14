# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_fhir_store_iam_policy             │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_fhir_store_iam_policy" "this" {

  fhir_store_id = ""     # string | required
  policy_data   = ""     # string | required
  id            = ""     # string | optional+computed

  # etag          = ""     # string | computed

}

