# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_connectivity_hub                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_connectivity_hub" "this" {

  description      = ""     # string | optional | An optional description of the hub.
  export_psc       = false  # bool | optional+computed | Whether Private Service Connect transitivity is enabled for …
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Optional labels in key:value format. For more information ab…
  name             = ""     # string | optional+computed | Immutable. The name of the hub. Hub names must be unique. Th…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Output only. The time the hub was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # routing_vpcs = [  # list(object)
  #   {
  #     uri = ""
  #   }
  # ]
  # state            = ""     # string | computed | Output only. The current lifecycle state of this hub.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # unique_id        = ""     # string | computed | Output only. The Google-generated UUID for the hub. This val…
  # update_time      = ""     # string | computed | Output only. The time the hub was last updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

