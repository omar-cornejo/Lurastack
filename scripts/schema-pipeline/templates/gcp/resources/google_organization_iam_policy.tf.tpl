# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_organization_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_organization_iam_policy" "this" {

  org_id      = ""     # string | required | The numeric ID of the organization in which you want to mana…
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}

