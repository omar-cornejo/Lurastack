# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_healthcare_hl7_v2_store_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
data "google_healthcare_hl7_v2_store_iam_policy" "this" {

  hl7_v2_store_id = ""     # string | required
  id              = ""     # string | optional+computed

  # etag            = ""     # string | computed
  # policy_data     = ""     # string | computed

}

