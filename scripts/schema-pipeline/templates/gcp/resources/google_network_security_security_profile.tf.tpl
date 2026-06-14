# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_security_profile            │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_security_profile" "this" {

  name             = ""     # string | required | The name of the security profile resource.
  type             = ""     # string | required | The type of security profile. Possible values: ["THREAT_PREV…
  description      = ""     # string | optional | An optional description of the security profile. The Max len…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | A map of key/value label pairs to assign to the resource.   …
  location         = ""     # string | optional | The location of the security profile. The default value is '…
  parent           = ""     # string | optional | The name of the parent this security profile belongs to. For…

  # create_time      = ""     # string | computed | Time the security profile was created in UTC.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | This checksum is computed by the server based on the value o…
  # self_link        = ""     # string | computed | Server-defined URL of this resource.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Time the security profile was updated in UTC.

  threat_prevention_profile { # list [0..1]

    severity_overrides { # list
      action   = ""     # string | required | Threat action override. Possible values: ["ALERT", "ALLOW", …
      severity = ""     # string | required | Severity level to match. Possible values: ["CRITICAL", "HIGH…

    }

    threat_overrides { # list
      action    = ""     # string | required | Threat action. Possible values: ["ALERT", "ALLOW", "DEFAULT_…
      threat_id = ""     # string | required | Vendor-specific ID of a threat to override.

      # type      = ""     # string | computed | Type of threat.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

