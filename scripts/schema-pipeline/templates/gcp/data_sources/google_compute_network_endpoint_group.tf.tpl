# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_network_endpoint_group                   │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_network_endpoint_group" "this" {

  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional | Name of the resource; provided by the client when the resour…
  project               = ""     # string | optional
  self_link             = ""     # string | optional
  zone                  = ""     # string | optional | Zone where the network endpoint group is located.

  # default_port          = 0      # number | computed | The default port used if the port number is not specified in…
  # description           = ""     # string | computed | An optional description of this resource. Provide this prope…
  # network               = ""     # string | computed | The network to which all network endpoints in the NEG belong…
  # network_endpoint_type = ""     # string | computed | Type of network endpoints in this network endpoint group. NO…
  # size                  = 0      # number | computed | Number of network endpoints in the network endpoint group.
  # subnetwork            = ""     # string | computed | Optional subnetwork to which all network endpoints in the NE…

}

