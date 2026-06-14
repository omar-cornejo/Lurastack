# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_azure_client                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_azure_client" "this" {

  application_id = ""     # string | required | The Azure Active Directory Application ID.
  location       = ""     # string | required | The location for the resource
  name           = ""     # string | required | The name of this resource.
  tenant_id      = ""     # string | required | The Azure Active Directory Tenant ID.
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed | The project for the resource

  # certificate    = ""     # string | computed | Output only. The PEM encoded x509 certificate.
  # create_time    = ""     # string | computed | Output only. The time at which this resource was created.
  # uid            = ""     # string | computed | Output only. A globally unique identifier for the client.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

