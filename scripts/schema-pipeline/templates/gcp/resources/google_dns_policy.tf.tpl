# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_policy                                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_policy" "this" {

  name                      = ""     # string | required | User assigned name for this policy.
  description               = ""     # string | optional | A textual description field. Defaults to 'Managed by Terrafo…
  enable_inbound_forwarding = false  # bool | optional | Allows networks bound to this policy to receive DNS queries …
  enable_logging            = false  # bool | optional | Controls whether logging is enabled for the networks bound t…
  id                        = ""     # string | optional+computed
  project                   = ""     # string | optional+computed

  alternative_name_server_config { # list [0..1]

    target_name_servers { # set [1..*]
      ipv4_address    = ""     # string | required | IPv4 address to forward to.
      forwarding_path = ""     # string | optional | Forwarding path for this TargetNameServer. If unset or 'defa…

    }

  }

  networks { # set
    network_url = ""     # string | required | The id or fully qualified URL of the VPC network to forward …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

