# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_environment_iam_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_environment_iam_policy" "this" {

  env_id      = ""     # string | required
  org_id      = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

