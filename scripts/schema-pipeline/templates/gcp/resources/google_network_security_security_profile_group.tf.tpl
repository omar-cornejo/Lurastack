# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_security_profile_group      │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_security_profile_group" "this" {

  name                      = ""     # string | required | The name of the security profile group resource.
  description               = ""     # string | optional | An optional description of the profile. The Max length is 51…
  id                        = ""     # string | optional+computed
  labels                    = {}     # map(string) | optional | A map of key/value label pairs to assign to the resource.   …
  location                  = ""     # string | optional | The location of the security profile group. The default valu…
  parent                    = ""     # string | optional | The name of the parent this security profile group belongs t…
  threat_prevention_profile = ""     # string | optional | Reference to a SecurityProfile with the threat prevention co…

  # create_time               = ""     # string | computed | Time the security profile group was created in UTC.
  # effective_labels          = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                      = ""     # string | computed | This checksum is computed by the server based on the value o…
  # terraform_labels          = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time               = ""     # string | computed | Time the security profile group was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

