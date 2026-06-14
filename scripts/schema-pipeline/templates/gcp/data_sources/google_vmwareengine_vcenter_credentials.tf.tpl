# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_vcenter_credentials                 │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_vcenter_credentials" "this" {

  parent   = ""     # string | required | The resource name of the private cloud which contains vcente…
  id       = ""     # string | optional+computed

  # password = ""     # string | computed | Initial password.
  # username = ""     # string | computed | Initial username.

}

