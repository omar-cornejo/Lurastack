# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appfabric_app_authorization                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appfabric_app_authorization" "this" {

  app            = ""     # string | required
  app_bundle_arn = ""     # string | required
  auth_type      = ""     # string | required
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # auth_url       = ""     # string | computed
  # created_at     = ""     # string | computed
  # id             = ""     # string | computed
  # persona        = ""     # string | computed
  # tags_all       = {}     # map(string) | computed
  # updated_at     = ""     # string | computed

  credential { # list

    api_key_credential { # list
      api_key = ""     # string | required+sensitive

    }

    oauth2_credential { # list
      client_id     = ""     # string | required
      client_secret = ""     # string | required+sensitive

    }

  }

  tenant { # list
    tenant_display_name = ""     # string | required
    tenant_identifier   = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

