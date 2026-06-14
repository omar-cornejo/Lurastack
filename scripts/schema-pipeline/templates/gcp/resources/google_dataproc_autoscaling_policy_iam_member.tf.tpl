# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_autoscaling_policy_iam_member       │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_autoscaling_policy_iam_member" "this" {

  member    = ""     # string | required
  policy_id = ""     # string | required
  role      = ""     # string | required
  id        = ""     # string | optional+computed
  location  = ""     # string | optional+computed
  project   = ""     # string | optional+computed

  # etag      = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

