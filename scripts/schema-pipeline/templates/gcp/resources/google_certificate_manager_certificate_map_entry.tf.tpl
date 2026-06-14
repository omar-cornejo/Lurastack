# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_certificate_manager_certificate_map_entry    │
# └──────────────────────────────────────────────────────────────┘
resource "google_certificate_manager_certificate_map_entry" "this" {

  certificates     = []     # list(string) | required | A set of Certificates defines for the given hostname. There …
  map              = ""     # string | required | A map entry that is inputted into the cetrificate map
  name             = ""     # string | required | A user-defined name of the Certificate Map Entry. Certificat…
  description      = ""     # string | optional | A human-readable description of the resource.
  hostname         = ""     # string | optional | A Hostname (FQDN, e.g. example.com) or a wildcard hostname e…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Set of labels associated with a Certificate Map Entry. An ob…
  matcher          = ""     # string | optional | A predefined matcher for particular cases, other than SNI se…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Creation timestamp of a Certificate Map Entry. Timestamp in …
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state            = ""     # string | computed | A serving state of this Certificate Map Entry.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Update timestamp of a Certificate Map Entry. Timestamp in RF…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

