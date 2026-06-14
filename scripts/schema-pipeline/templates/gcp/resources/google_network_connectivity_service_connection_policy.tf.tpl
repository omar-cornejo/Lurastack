# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_connectivity_service_connection_policy  │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_connectivity_service_connection_policy" "this" {

  location         = ""     # string | required | The location of the ServiceConnectionPolicy.
  name             = ""     # string | required | The name of a ServiceConnectionPolicy. Format: projects/{pro…
  network          = ""     # string | required | The resource path of the consumer network. Example: - projec…
  service_class    = ""     # string | required | The service class identifier for which this ServiceConnectio…
  description      = ""     # string | optional | Free-text description of the resource.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels.   **Note**: This field is non-authorita…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | The timestamp when the resource was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | The etag is computed by the server, and may be sent on updat…
  # infrastructure   = ""     # string | computed | The type of underlying resources used to create the connecti…
  # psc_connections = [  # list(object)
  #   {
  #     consumer_address = ""
  #     consumer_forwarding_rule = ""
  #     consumer_target_project = ""
  #     error = [  # list(object)
  #       {
  #         code = 0
  #         details = []  # list(map(string))
  #         message = ""
  #       }
  #     ]
  #     error_info = [  # list(object)
  #       {
  #         domain = ""
  #         metadata = {}  # map(string)
  #         reason = ""
  #       }
  #     ]
  #     error_type = ""
  #     gce_operation = ""
  #     psc_connection_id = ""
  #     state = ""
  #   }
  # ]
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp when the resource was updated.

  psc_config { # list [0..1]
    subnetworks = []     # list(string) | required | IDs of the subnetworks or fully qualified identifiers for th…
    limit       = ""     # string | optional | Max number of PSC connections for this policy.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

