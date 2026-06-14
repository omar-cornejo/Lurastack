# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_certificate_manager_certificate_map              │
# └──────────────────────────────────────────────────────────────┘
data "google_certificate_manager_certificate_map" "this" {

  name             = ""     # string | required | A user-defined name of the Certificate Map. Certificate Map …
  id               = ""     # string | optional+computed
  project          = ""     # string | optional

  # create_time      = ""     # string | computed | Creation timestamp of a Certificate Map. Timestamp is in RFC…
  # description      = ""     # string | computed | A human-readable description of the resource.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # gclb_targets = [  # list(object)
  #   {
  #     ip_configs = [  # list(object)
  #       {
  #         ip_address = ""
  #         ports = []  # list(number)
  #       }
  #     ]
  #     target_https_proxy = ""
  #     target_ssl_proxy = ""
  #   }
  # ]
  # labels           = {}     # map(string) | computed | Set of labels associated with a Certificate Map resource.   …
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Update timestamp of a Certificate Map. Timestamp is in RFC33…

}

