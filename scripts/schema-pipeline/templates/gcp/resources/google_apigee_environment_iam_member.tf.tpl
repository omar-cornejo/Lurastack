# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_environment_iam_member                │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_environment_iam_member" "this" {

  env_id = ""     # string | required
  member = ""     # string | required
  org_id = ""     # string | required
  role   = ""     # string | required
  id     = ""     # string | optional+computed

  # etag   = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

