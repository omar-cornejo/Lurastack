# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_organization_iam_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_organization_iam_policy" "this" {

  org_id      = ""     # string | required | The numeric ID of the organization in which you want to mana…
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

