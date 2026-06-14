# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_ids_endpoint                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_ids_endpoint" "this" {

  location                 = ""     # string | required | The location for the endpoint.
  name                     = ""     # string | required | Name of the endpoint in the format projects/{project_id}/loc…
  network                  = ""     # string | required | Name of the VPC network that is connected to the IDS endpoin…
  severity                 = ""     # string | required | The minimum alert severity level that is reported by the end…
  description              = ""     # string | optional | An optional description of the endpoint.
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed
  threat_exceptions        = []     # list(string) | optional | Configuration for threat IDs excluded from generating alerts…

  # create_time              = ""     # string | computed | Creation timestamp in RFC 3339 text format.
  # endpoint_forwarding_rule = ""     # string | computed | URL of the endpoint's network address to which traffic is to…
  # endpoint_ip              = ""     # string | computed | Internal IP address of the endpoint's network entry point.
  # update_time              = ""     # string | computed | Last update timestamp in RFC 3339 text format.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

