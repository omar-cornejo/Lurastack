# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_service_networking_peered_dns_domain             │
# └──────────────────────────────────────────────────────────────┘
data "google_service_networking_peered_dns_domain" "this" {

  name       = ""     # string | required
  network    = ""     # string | required
  project    = ""     # string | required
  service    = ""     # string | required
  id         = ""     # string | optional+computed

  # dns_suffix = ""     # string | computed
  # parent     = ""     # string | computed

}

