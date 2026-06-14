# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dns_managed_zone                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_dns_managed_zone" "this" {

  name            = ""     # string | required
  project         = ""     # string | optional

  # description     = ""     # string | computed
  # dns_name        = ""     # string | computed
  # id              = ""     # string | computed
  # managed_zone_id = 0      # number | computed
  # name_servers    = []     # list(string) | computed
  # visibility      = ""     # string | computed

}

