# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_dicom_store_iam_policy            │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_dicom_store_iam_policy" "this" {

  dicom_store_id = ""     # string | required
  policy_data    = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed

}

