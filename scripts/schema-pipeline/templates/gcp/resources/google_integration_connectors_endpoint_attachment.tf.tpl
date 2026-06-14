# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_integration_connectors_endpoint_attachment   │
# └──────────────────────────────────────────────────────────────┘
resource "google_integration_connectors_endpoint_attachment" "this" {

  location               = ""     # string | required | Location in which Endpoint Attachment needs to be created.
  name                   = ""     # string | required | Name of Endpoint Attachment needs to be created.
  service_attachment     = ""     # string | required | The path of the service attachment.
  description            = ""     # string | optional | Description of the resource.
  endpoint_global_access = false  # bool | optional | Enable global access for endpoint attachment.
  id                     = ""     # string | optional+computed
  labels                 = {}     # map(string) | optional | Resource labels to represent user provided metadata.   **Not…
  project                = ""     # string | optional+computed

  # create_time            = ""     # string | computed | Time the Namespace was created in UTC.
  # effective_labels       = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # endpoint_ip            = ""     # string | computed | The Private Service Connect connection endpoint ip.
  # terraform_labels       = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time            = ""     # string | computed | Time the Namespace was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

