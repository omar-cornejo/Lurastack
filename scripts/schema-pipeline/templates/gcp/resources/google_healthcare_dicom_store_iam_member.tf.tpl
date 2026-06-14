# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_dicom_store_iam_member            │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_dicom_store_iam_member" "this" {

  dicom_store_id = ""     # string | required
  member         = ""     # string | required
  role           = ""     # string | required
  id             = ""     # string | optional+computed

  # etag           = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

