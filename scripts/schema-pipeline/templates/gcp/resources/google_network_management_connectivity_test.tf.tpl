# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_management_connectivity_test         │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_management_connectivity_test" "this" {

  name             = ""     # string | required | Unique name for the connectivity test.
  description      = ""     # string | optional | The user-supplied description of the Connectivity Test. Maxi…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Resource labels to represent user-provided metadata.   **Not…
  project          = ""     # string | optional+computed
  protocol         = ""     # string | optional | IP Protocol of the test. When not provided, "TCP" is assumed…
  related_projects = []     # list(string) | optional | Other projects that may be relevant for reachability analysi…

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  destination { # list [1..1]
    instance   = ""     # string | optional | A Compute Engine instance URI.
    ip_address = ""     # string | optional | The IP address of the endpoint, which can be an external or …
    network    = ""     # string | optional | A Compute Engine network URI.
    port       = 0      # number | optional | The IP protocol port of the endpoint. Only applicable when p…
    project_id = ""     # string | optional | Project ID where the endpoint is located. The Project ID can…

  }

  source { # list [1..1]
    instance     = ""     # string | optional | A Compute Engine instance URI.
    ip_address   = ""     # string | optional | The IP address of the endpoint, which can be an external or …
    network      = ""     # string | optional | A Compute Engine network URI.
    network_type = ""     # string | optional | Type of the network where the endpoint is located. Possible …
    port         = 0      # number | optional | The IP protocol port of the endpoint. Only applicable when p…
    project_id   = ""     # string | optional | Project ID where the endpoint is located. The Project ID can…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

