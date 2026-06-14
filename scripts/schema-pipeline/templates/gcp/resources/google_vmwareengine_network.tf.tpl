# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vmwareengine_network                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_vmwareengine_network" "this" {

  location     = ""     # string | required | The location where the VMwareEngineNetwork should reside.
  name         = ""     # string | required | The ID of the VMwareEngineNetwork.
  type         = ""     # string | required | VMware Engine network type. Possible values: ["LEGACY", "STA…
  description  = ""     # string | optional | User-provided description for this VMware Engine network.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # state        = ""     # string | computed | State of the VMware Engine network.
  # uid          = ""     # string | computed | System-generated unique identifier for the resource.
  # vpc_networks = [  # list(object)
  #   {
  #     network = ""
  #     type = ""
  #   }
  # ]

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

