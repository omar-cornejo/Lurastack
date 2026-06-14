# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_ssl_policy                               │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_ssl_policy" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # custom_features    = []     # set(string) | computed | Profile specifies the set of SSL features that can be used b…
  # description        = ""     # string | computed | An optional description of this resource.
  # enabled_features   = []     # set(string) | computed | The list of features enabled in the SSL policy.
  # fingerprint        = ""     # string | computed | Fingerprint of this resource. A hash of the contents stored …
  # min_tls_version    = ""     # string | computed | The minimum version of SSL protocol that can be used by the …
  # profile            = ""     # string | computed | Profile specifies the set of SSL features that can be used b…
  # self_link          = ""     # string | computed

}

