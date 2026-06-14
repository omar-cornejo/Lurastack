# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dns_managed_zones                                │
# └──────────────────────────────────────────────────────────────┘
data "google_dns_managed_zones" "this" {

  project       = ""     # string | optional

  # id            = ""     # string | computed
  # managed_zones = [  # list(object)
  #   {
  #     description = ""
  #     dns_name = ""
  #     id = ""
  #     managed_zone_id = 0
  #     name = ""
  #     name_servers = []  # list(string)
  #     project = ""
  #     visibility = ""
  #   }
  # ]

}

