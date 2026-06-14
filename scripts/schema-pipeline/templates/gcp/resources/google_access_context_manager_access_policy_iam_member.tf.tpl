# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_access_policy_iam_member  │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_access_policy_iam_member" "this" {

  member = ""     # string | required
  name   = ""     # string | required
  role   = ""     # string | required
  id     = ""     # string | optional+computed

  # etag   = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

