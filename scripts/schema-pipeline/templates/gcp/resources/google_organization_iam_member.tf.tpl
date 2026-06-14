# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_organization_iam_member                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_organization_iam_member" "this" {

  member = ""     # string | required
  org_id = ""     # string | required | The numeric ID of the organization in which you want to mana…
  role   = ""     # string | required
  id     = ""     # string | optional+computed

  # etag   = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

