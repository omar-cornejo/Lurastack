# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_workbench_instance_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "google_workbench_instance_iam_policy" "this" {

  name        = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

