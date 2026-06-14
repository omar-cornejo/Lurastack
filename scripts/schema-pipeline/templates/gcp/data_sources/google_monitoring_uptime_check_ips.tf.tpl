# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_monitoring_uptime_check_ips                      │
# └──────────────────────────────────────────────────────────────┘
data "google_monitoring_uptime_check_ips" "this" {

  id               = ""     # string | optional+computed

  # uptime_check_ips = [  # list(object)
  #   {
  #     ip_address = ""
  #     location = ""
  #     region = ""
  #   }
  # ]

}

