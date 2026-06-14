# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_autoscaling_policy_iam_policy       │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_autoscaling_policy_iam_policy" "this" {

  policy_data = ""     # string | required
  policy_id   = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

