# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vmwareengine_external_address                │
# └──────────────────────────────────────────────────────────────┘
resource "google_vmwareengine_external_address" "this" {

  internal_ip = ""     # string | required | The internal IP address of a workload VM.
  name        = ""     # string | required | The ID of the external IP Address.
  parent      = ""     # string | required | The resource name of the private cloud to create a new exter…
  description = ""     # string | optional | User-provided description for this resource.
  id          = ""     # string | optional+computed

  # create_time = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # external_ip = ""     # string | computed | The external IP address of a workload VM.
  # state       = ""     # string | computed | State of the resource.
  # uid         = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

