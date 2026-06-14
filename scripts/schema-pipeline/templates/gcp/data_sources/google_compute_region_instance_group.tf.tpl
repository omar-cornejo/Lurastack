# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_region_instance_group                    │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_region_instance_group" "this" {

  id        = ""     # string | optional+computed
  name      = ""     # string | optional+computed
  project   = ""     # string | optional+computed
  region    = ""     # string | optional+computed
  self_link = ""     # string | optional+computed

  # instances = [  # list(object)
  #   {
  #     instance = ""
  #     named_ports = [  # list(object)
  #       {
  #         name = ""
  #         port = 0
  #       }
  #     ]
  #     status = ""
  #   }
  # ]
  # size      = 0      # number | computed

}

