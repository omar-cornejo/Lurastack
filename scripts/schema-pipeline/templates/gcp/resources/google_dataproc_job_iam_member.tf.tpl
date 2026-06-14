# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_job_iam_member                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_job_iam_member" "this" {

  job_id  = ""     # string | required
  member  = ""     # string | required
  role    = ""     # string | required
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

