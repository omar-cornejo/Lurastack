# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_service_attachment                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_service_attachment" "this" {

  connection_preference = ""     # string | required | The connection preference to use for this service attachment…
  enable_proxy_protocol = false  # bool | required | If true, enable the proxy protocol which is for supplying cl…
  name                  = ""     # string | required | Name of the resource. The name must be 1-63 characters long,…
  nat_subnets           = []     # list(string) | required | An array of subnets that is provided for NAT in this service…
  target_service        = ""     # string | required | The URL of a service serving the endpoint identified by this…
  consumer_reject_lists = []     # list(string) | optional | An array of projects that are not allowed to connect to this…
  description           = ""     # string | optional | An optional description of this resource.
  domain_names          = []     # list(string) | optional | If specified, the domain name will be used during the integr…
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed
  reconcile_connections = false  # bool | optional+computed | This flag determines whether a consumer accept/reject list c…
  region                = ""     # string | optional+computed | URL of the region where the resource resides.

  # connected_endpoints = [  # list(object)
  #   {
  #     endpoint = ""
  #     status = ""
  #   }
  # ]
  # fingerprint           = ""     # string | computed | Fingerprint of this resource. This field is used internally …
  # self_link             = ""     # string | computed

  consumer_accept_lists { # set
    connection_limit  = 0      # number | required | The number of consumer forwarding rules the consumer project…
    network_url       = ""     # string | optional | The network that is allowed to connect to this service attac…
    project_id_or_num = ""     # string | optional | A project that is allowed to connect to this service attachm…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

