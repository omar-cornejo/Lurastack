# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_tls_inspection_policy       │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_tls_inspection_policy" "this" {

  ca_pool               = ""     # string | required | A CA pool resource used to issue interception certificates.
  name                  = ""     # string | required | Short name of the TlsInspectionPolicy resource to be created…
  custom_tls_features   = []     # list(string) | optional | List of custom TLS cipher suites selected. This field is val…
  description           = ""     # string | optional | Free-text description of the resource.
  exclude_public_ca_set = false  # bool | optional | If FALSE (the default), use our default set of public CAs in…
  id                    = ""     # string | optional+computed
  location              = ""     # string | optional | The location of the tls inspection policy.
  min_tls_version       = ""     # string | optional | Minimum TLS version that the firewall should use when negoti…
  project               = ""     # string | optional+computed
  tls_feature_profile   = ""     # string | optional | The selected Profile. If this is not set, then the default v…
  trust_config          = ""     # string | optional | A TrustConfig resource used when making a connection to the …

  # create_time           = ""     # string | computed | The timestamp when the resource was created.
  # update_time           = ""     # string | computed | The timestamp when the resource was updated.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

