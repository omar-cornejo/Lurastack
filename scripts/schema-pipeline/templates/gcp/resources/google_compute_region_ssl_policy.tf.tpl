# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_ssl_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_ssl_policy" "this" {

  name               = ""     # string | required | Name of the resource. Provided by the client when the resour…
  custom_features    = []     # set(string) | optional | A list of features enabled when the selected profile is CUST…
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  min_tls_version    = ""     # string | optional | The minimum version of SSL protocol that can be used by the …
  profile            = ""     # string | optional | Profile specifies the set of SSL features that can be used b…
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | The region where the regional SSL policy resides.

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # enabled_features   = []     # set(string) | computed | The list of features enabled in the SSL policy.
  # fingerprint        = ""     # string | computed | Fingerprint of this resource. A hash of the contents stored …
  # self_link          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

