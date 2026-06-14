# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_network                             │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_network" "this" {

  location     = ""     # string | required | The location where the VMwareEngineNetwork should reside.
  name         = ""     # string | required | The ID of the VMwareEngineNetwork.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional

  # description  = ""     # string | computed | User-provided description for this VMware Engine network.
  # state        = ""     # string | computed | State of the VMware Engine network.
  # type         = ""     # string | computed | VMware Engine network type. Possible values: ["LEGACY", "STA…
  # uid          = ""     # string | computed | System-generated unique identifier for the resource.
  # vpc_networks = [  # list(object)
  #   {
  #     network = ""
  #     type = ""
  #   }
  # ]

}

