# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_addons_config                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_addons_config" "this" {

  org = ""     # string | required | Name of the Apigee organization.
  id  = ""     # string | optional+computed

  addons_config { # list [0..1]

    advanced_api_ops_config { # list [0..1]
      enabled = false  # bool | optional | Flag that specifies whether the Advanced API Ops add-on is e…

    }

    api_security_config { # list [0..1]
      enabled    = false  # bool | optional | Flag that specifies whether the Advanced API Ops add-on is e…

      # expires_at = ""     # string | computed | Flag that specifies whether the Advanced API Ops add-on is e…

    }

    connectors_platform_config { # list [0..1]
      enabled    = false  # bool | optional | Flag that specifies whether the Advanced API Ops add-on is e…

      # expires_at = ""     # string | computed | Flag that specifies whether the Advanced API Ops add-on is e…

    }

    integration_config { # list [0..1]
      enabled = false  # bool | optional | Flag that specifies whether the Advanced API Ops add-on is e…

    }

    monetization_config { # list [0..1]
      enabled = false  # bool | optional | Flag that specifies whether the Advanced API Ops add-on is e…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

