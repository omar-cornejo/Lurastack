# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_nsx_credentials                     │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_nsx_credentials" "this" {

  parent   = ""     # string | required | The resource name of the private cloud which contains NSX. R…
  id       = ""     # string | optional+computed

  # password = ""     # string | computed | Initial password.
  # username = ""     # string | computed | Initial username.

}

