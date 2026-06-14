# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_apigee_environment_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
data "google_apigee_environment_iam_policy" "this" {

  env_id      = ""     # string | required
  org_id      = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

