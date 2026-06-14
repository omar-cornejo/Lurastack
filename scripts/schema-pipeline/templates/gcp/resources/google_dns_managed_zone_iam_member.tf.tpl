# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_managed_zone_iam_member                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_managed_zone_iam_member" "this" {

  managed_zone = ""     # string | required
  member       = ""     # string | required
  role         = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # etag         = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

