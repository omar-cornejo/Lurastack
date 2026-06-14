# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_endpoint_attachment                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_endpoint_attachment" "this" {

  endpoint_attachment_id = ""     # string | required | ID of the endpoint attachment.
  location               = ""     # string | required | Location of the endpoint attachment.
  org_id                 = ""     # string | required | The Apigee Organization associated with the Apigee instance,…
  service_attachment     = ""     # string | required | Format: projects/*/regions/*/serviceAttachments/*
  id                     = ""     # string | optional+computed

  # connection_state       = ""     # string | computed | State of the endpoint attachment connection to the service a…
  # host                   = ""     # string | computed | Host that can be used in either HTTP Target Endpoint directl…
  # name                   = ""     # string | computed | Name of the Endpoint Attachment in the following format: org…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

