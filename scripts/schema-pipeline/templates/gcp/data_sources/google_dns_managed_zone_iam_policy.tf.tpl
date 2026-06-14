# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dns_managed_zone_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_dns_managed_zone_iam_policy" "this" {

  managed_zone = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed
  # policy_data  = ""     # string | computed

}

