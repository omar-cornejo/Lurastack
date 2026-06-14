# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataproc_autoscaling_policy_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
data "google_dataproc_autoscaling_policy_iam_policy" "this" {

  policy_id   = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

