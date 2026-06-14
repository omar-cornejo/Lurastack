# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_target_server                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_target_server" "this" {

  env_id      = ""     # string | required | The Apigee environment group associated with the Apigee envi…
  host        = ""     # string | required | The host name this target connects to. Value must be a valid…
  name        = ""     # string | required | The resource id of this reference. Values must match the reg…
  port        = 0      # number | required | The port number this target connects to on the given host. V…
  description = ""     # string | optional | A human-readable description of this TargetServer.
  id          = ""     # string | optional+computed
  is_enabled  = false  # bool | optional | Enabling/disabling a TargetServer is useful when TargetServe…
  protocol    = ""     # string | optional+computed | Immutable. The protocol used by this TargetServer. Possible …

  s_sl_info { # list [0..1]
    enabled                  = false  # bool | required | Enables TLS. If false, neither one-way nor two-way TLS will …
    ciphers                  = []     # list(string) | optional | The SSL/TLS cipher suites to be used. For programmable proxi…
    client_auth_enabled      = false  # bool | optional | Enables two-way TLS.
    ignore_validation_errors = false  # bool | optional | If true, Edge ignores TLS certificate errors. Valid when con…
    key_alias                = ""     # string | optional | Required if clientAuthEnabled is true. The resource ID for t…
    key_store                = ""     # string | optional | Required if clientAuthEnabled is true. The resource ID of th…
    protocols                = []     # list(string) | optional | The TLS versioins to be used.
    trust_store              = ""     # string | optional | The resource ID of the truststore.

    common_name { # list [0..1]
      value          = ""     # string | optional | The TLS Common Name string of the certificate.
      wildcard_match = false  # bool | optional | Indicates whether the cert should be matched against as a wi…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

