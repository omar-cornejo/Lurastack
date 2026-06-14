# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataproc_job_iam_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_dataproc_job_iam_policy" "this" {

  job_id      = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

