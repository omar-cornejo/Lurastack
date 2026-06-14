# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_hl7_v2_store_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_hl7_v2_store_iam_policy" "this" {

  hl7_v2_store_id = ""     # string | required
  policy_data     = ""     # string | required
  id              = ""     # string | optional+computed

  # etag            = ""     # string | computed

}

