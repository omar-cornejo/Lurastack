# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_address_group               │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_address_group" "this" {

  capacity         = 0      # number | required | Capacity of the Address Group.
  location         = ""     # string | required | The location of the gateway security policy. The default val…
  name             = ""     # string | required | Name of the AddressGroup resource.
  type             = ""     # string | required | The type of the Address Group. Possible values are "IPV4" or…
  description      = ""     # string | optional | Free-text description of the resource.
  id               = ""     # string | optional+computed
  items            = []     # list(string) | optional | List of items.
  labels           = {}     # map(string) | optional | Set of label tags associated with the AddressGroup resource.…
  parent           = ""     # string | optional | The name of the parent this address group belongs to. Format…

  # create_time      = ""     # string | computed | The timestamp when the resource was created. A timestamp in …
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp when the resource was updated. A timestamp in …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

