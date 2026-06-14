# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_integration_connectors_managed_zone          │
# └──────────────────────────────────────────────────────────────┘
resource "google_integration_connectors_managed_zone" "this" {

  dns              = ""     # string | required | DNS Name of the resource.
  name             = ""     # string | required | Name of Managed Zone needs to be created.
  target_project   = ""     # string | required | The name of the Target Project.
  target_vpc       = ""     # string | required | The name of the Target Project VPC Network.
  description      = ""     # string | optional | Description of the resource.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Resource labels to represent user provided metadata.   **Not…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Time the Namespace was created in UTC.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Time the Namespace was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

