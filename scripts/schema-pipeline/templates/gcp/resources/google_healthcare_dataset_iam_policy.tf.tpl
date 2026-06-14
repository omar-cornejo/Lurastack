# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_dataset_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_dataset_iam_policy" "this" {

  dataset_id  = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

