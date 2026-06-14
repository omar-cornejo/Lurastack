# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_external_address                    │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_external_address" "this" {

  name        = ""     # string | required | The ID of the external IP Address.
  parent      = ""     # string | required | The resource name of the private cloud to create a new exter…
  id          = ""     # string | optional+computed

  # create_time = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # description = ""     # string | computed | User-provided description for this resource.
  # external_ip = ""     # string | computed | The external IP address of a workload VM.
  # internal_ip = ""     # string | computed | The internal IP address of a workload VM.
  # state       = ""     # string | computed | State of the resource.
  # uid         = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…

}

