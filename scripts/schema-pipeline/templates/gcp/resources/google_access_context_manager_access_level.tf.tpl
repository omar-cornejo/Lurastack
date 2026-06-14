# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_access_level          │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_access_level" "this" {

  name        = ""     # string | required | Resource name for the Access Level. The short_name component…
  parent      = ""     # string | required | The AccessPolicy this AccessLevel lives in. Format: accessPo…
  title       = ""     # string | required | Human readable title. Must be unique within the Policy.
  description = ""     # string | optional | Description of the AccessLevel and its use. Does not affect …
  id          = ""     # string | optional+computed

  basic { # list [0..1]
    combining_function = ""     # string | optional | How the conditions list should be combined to determine if a…

    conditions { # list [1..*]
      ip_subnetworks         = []     # list(string) | optional | A list of CIDR block IP subnetwork specification. May be IPv…
      members                = []     # list(string) | optional | An allowed list of members (users, service accounts). Using …
      negate                 = false  # bool | optional | Whether to negate the Condition. If true, the Condition beco…
      regions                = []     # list(string) | optional | The request must originate from one of the provided countrie…
      required_access_levels = []     # list(string) | optional | A list of other access levels defined in the same Policy, re…

      device_policy { # list [0..1]
        allowed_device_management_levels = []     # list(string) | optional | A list of allowed device management levels. An empty list al…
        allowed_encryption_statuses      = []     # list(string) | optional | A list of allowed encryptions statuses. An empty list allows…
        require_admin_approval           = false  # bool | optional | Whether the device needs to be approved by the customer admi…
        require_corp_owned               = false  # bool | optional | Whether the device needs to be corp owned.
        require_screen_lock              = false  # bool | optional | Whether or not screenlock is required for the DevicePolicy t…

        os_constraints { # list
          os_type                    = ""     # string | required | The operating system type of the device. Possible values: ["…
          minimum_version            = ""     # string | optional | The minimum allowed OS version. If not set, any version of t…
          require_verified_chrome_os = false  # bool | optional | If you specify DESKTOP_CHROME_OS for osType, you can optiona…

        }

      }

      vpc_network_sources { # list

        vpc_subnetwork { # list [0..1]
          network            = ""     # string | required | Required. Network name to be allowed by this Access Level. N…
          vpc_ip_subnetworks = []     # list(string) | optional | CIDR block IP subnetwork specification. Must be IPv4.

        }

      }

    }

  }

  custom { # list [0..1]

    expr { # list [1..1]
      expression  = ""     # string | required | Textual representation of an expression in Common Expression…
      description = ""     # string | optional | Description of the expression
      location    = ""     # string | optional | String indicating the location of the expression for error r…
      title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

