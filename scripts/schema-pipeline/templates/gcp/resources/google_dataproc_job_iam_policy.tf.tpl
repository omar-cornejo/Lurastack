# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_job_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_job_iam_policy" "this" {

  job_id      = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

