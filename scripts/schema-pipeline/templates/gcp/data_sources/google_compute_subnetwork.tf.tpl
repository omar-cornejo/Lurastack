# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_subnetwork                               │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_subnetwork" "this" {

  id                       = ""     # string | optional+computed
  name                     = ""     # string | optional
  project                  = ""     # string | optional+computed
  region                   = ""     # string | optional+computed
  self_link                = ""     # string | optional+computed

  # description              = ""     # string | computed
  # gateway_address          = ""     # string | computed
  # internal_ipv6_prefix     = ""     # string | computed
  # ip_cidr_range            = ""     # string | computed
  # network                  = ""     # string | computed
  # private_ip_google_access = false  # bool | computed
  # secondary_ip_range = [  # list(object)
  #   {
  #     ip_cidr_range = ""
  #     range_name = ""
  #   }
  # ]

}

