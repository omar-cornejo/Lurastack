# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_router_status                            │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_router_status" "this" {

  name                   = ""     # string | required | Name of the router to query.
  id                     = ""     # string | optional+computed
  project                = ""     # string | optional | Project ID of the target router.
  region                 = ""     # string | optional+computed | Region of the target router.

  # best_routes = [  # list(object)
  #   {
  #     description = ""
  #     dest_range = ""
  #     name = ""
  #     network = ""
  #     next_hop_gateway = ""
  #     next_hop_ilb = ""
  #     next_hop_instance = ""
  #     next_hop_instance_zone = ""
  #     next_hop_ip = ""
  #     next_hop_network = ""
  #     next_hop_vpn_tunnel = ""
  #     priority = 0
  #     project = ""
  #     self_link = ""
  #     tags = []  # set(string)
  #   }
  # ]
  # best_routes_for_router = [  # list(object)
  #   {
  #     description = ""
  #     dest_range = ""
  #     name = ""
  #     network = ""
  #     next_hop_gateway = ""
  #     next_hop_ilb = ""
  #     next_hop_instance = ""
  #     next_hop_instance_zone = ""
  #     next_hop_ip = ""
  #     next_hop_network = ""
  #     next_hop_vpn_tunnel = ""
  #     priority = 0
  #     project = ""
  #     self_link = ""
  #     tags = []  # set(string)
  #   }
  # ]
  # network                = ""     # string | computed | URI of the network to which this router belongs.

}

