# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dns_record_set                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_dns_record_set" "this" {

  managed_zone = ""     # string | required
  name         = ""     # string | required
  type         = ""     # string | required
  id           = ""     # string | optional+computed
  project      = ""     # string | optional

  # rrdatas      = []     # list(string) | computed
  # ttl          = 0      # number | computed

}

