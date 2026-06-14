# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_environment_iam_binding               │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_environment_iam_binding" "this" {

  env_id  = ""     # string | required
  members = []     # set(string) | required
  org_id  = ""     # string | required
  role    = ""     # string | required
  id      = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

