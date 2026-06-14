# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_healthcare_dicom_store_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
data "google_healthcare_dicom_store_iam_policy" "this" {

  dicom_store_id = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed
  # policy_data    = ""     # string | computed

}

