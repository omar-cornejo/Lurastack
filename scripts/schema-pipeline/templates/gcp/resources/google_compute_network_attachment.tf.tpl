# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_network_attachment                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_network_attachment" "this" {

  connection_preference = ""     # string | required | The connection preference of service attachment. The value c…
  name                  = ""     # string | required | Name of the resource. Provided by the client when the resour…
  subnetworks           = []     # list(string) | required | An array of URLs where each entry is the URL of a subnet pro…
  description           = ""     # string | optional | An optional description of this resource. Provide this prope…
  producer_accept_lists = []     # list(string) | optional | Projects that are allowed to connect to this network attachm…
  producer_reject_lists = []     # list(string) | optional | Projects that are not allowed to connect to this network att…
  project               = ""     # string | optional+computed
  region                = ""     # string | optional+computed | URL of the region where the network attachment resides. This…

  # connection_endpoints = [  # list(object)
  #   {
  #     ip_address = ""
  #     project_id_or_num = ""
  #     secondary_ip_cidr_ranges = ""
  #     status = ""
  #     subnetwork = ""
  #   }
  # ]
  # creation_timestamp    = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # fingerprint           = ""     # string | computed | Fingerprint of this resource. A hash of the contents stored …
  # id                    = ""     # string | computed | The unique identifier for the resource type. The server gene…
  # kind                  = ""     # string | computed | Type of the resource.
  # network               = ""     # string | computed | The URL of the network which the Network Attachment belongs …
  # self_link             = ""     # string | computed | Server-defined URL for the resource.
  # self_link_with_id     = ""     # string | computed | Server-defined URL for this resource's resource id.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

