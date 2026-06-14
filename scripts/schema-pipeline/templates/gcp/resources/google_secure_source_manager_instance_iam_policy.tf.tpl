# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secure_source_manager_instance_iam_policy    │
# └──────────────────────────────────────────────────────────────┘
resource "google_secure_source_manager_instance_iam_policy" "this" {

  instance_id = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

