# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_managed_zone_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_managed_zone_iam_policy" "this" {

  managed_zone = ""     # string | required
  policy_data  = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

}

