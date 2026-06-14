# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_subnetworks                              │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_subnetworks" "this" {

  filter      = ""     # string | optional
  id          = ""     # string | optional+computed
  project     = ""     # string | optional
  region      = ""     # string | optional

  # subnetworks = [  # list(object)
  #   {
  #     description = ""
  #     ip_cidr_range = ""
  #     name = ""
  #     network = ""
  #     network_self_link = ""
  #     private_ip_google_access = false
  #     self_link = ""
  #   }
  # ]

}

