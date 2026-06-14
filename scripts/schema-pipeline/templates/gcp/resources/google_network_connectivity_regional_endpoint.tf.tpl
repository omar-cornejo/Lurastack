# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_connectivity_regional_endpoint       │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_connectivity_regional_endpoint" "this" {

  access_type         = ""     # string | required | The access type of this regional endpoint. This field is ref…
  location            = ""     # string | required | The location of the RegionalEndpoint.
  name                = ""     # string | required | The name of the RegionalEndpoint.
  target_google_api   = ""     # string | required | The service endpoint this private regional endpoint connects…
  address             = ""     # string | optional+computed | The IP Address of the Regional Endpoint. When no address is …
  description         = ""     # string | optional | A description of this resource.
  id                  = ""     # string | optional+computed
  labels              = {}     # map(string) | optional | User-defined labels.   **Note**: This field is non-authorita…
  network             = ""     # string | optional+computed | The name of the VPC network for this private regional endpoi…
  project             = ""     # string | optional+computed
  subnetwork          = ""     # string | optional+computed | The name of the subnetwork from which the IP address will be…

  # create_time         = ""     # string | computed | Time when the RegionalEndpoint was created.
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # psc_forwarding_rule = ""     # string | computed | The resource reference of the PSC Forwarding Rule created on…
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time         = ""     # string | computed | Time when the RegionalEndpoint was updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

