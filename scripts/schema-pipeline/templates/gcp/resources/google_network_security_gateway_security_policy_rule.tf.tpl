# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_gateway_security_policy_rule  │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_gateway_security_policy_rule" "this" {

  basic_profile           = ""     # string | required | Profile which tells what the primitive action should be. Pos…
  enabled                 = false  # bool | required | Whether the rule is enforced.
  gateway_security_policy = ""     # string | required | The name of the gatewat security policy this rule belongs to…
  location                = ""     # string | required | The location of the gateway security policy.
  name                    = ""     # string | required | Name of the resource. ame is the full resource name so proje…
  priority                = 0      # number | required | Priority of the rule. Lower number corresponds to higher pre…
  session_matcher         = ""     # string | required | CEL expression for matching on session criteria.
  application_matcher     = ""     # string | optional | CEL expression for matching on L7/application level criteria…
  description             = ""     # string | optional | Free-text description of the resource.
  id                      = ""     # string | optional+computed
  project                 = ""     # string | optional+computed
  tls_inspection_enabled  = false  # bool | optional | Flag to enable TLS inspection of traffic matching on. Can on…

  # create_time             = ""     # string | computed | The timestamp when the resource was created. A timestamp in …
  # self_link               = ""     # string | computed | Server-defined URL of this resource.
  # update_time             = ""     # string | computed | The timestamp when the resource was updated. A timestamp in …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

