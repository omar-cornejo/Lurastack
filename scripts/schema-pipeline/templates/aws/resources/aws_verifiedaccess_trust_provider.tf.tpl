# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedaccess_trust_provider                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedaccess_trust_provider" "this" {

  policy_reference_name      = ""     # string | required
  trust_provider_type        = ""     # string | required
  description                = ""     # string | optional
  device_trust_provider_type = ""     # string | optional
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed
  user_trust_provider_type   = ""     # string | optional

  device_options { # list [0..1]
    tenant_id = ""     # string | optional

  }

  native_application_oidc_options { # list [0..1]
    client_secret               = ""     # string | required+sensitive
    authorization_endpoint      = ""     # string | optional
    client_id                   = ""     # string | optional
    issuer                      = ""     # string | optional
    public_signing_key_endpoint = ""     # string | optional
    scope                       = ""     # string | optional
    token_endpoint              = ""     # string | optional
    user_info_endpoint          = ""     # string | optional

  }

  oidc_options { # list [0..1]
    client_secret          = ""     # string | required+sensitive
    authorization_endpoint = ""     # string | optional
    client_id              = ""     # string | optional
    issuer                 = ""     # string | optional
    scope                  = ""     # string | optional
    token_endpoint         = ""     # string | optional
    user_info_endpoint     = ""     # string | optional

  }

  sse_specification { # list [0..1]
    customer_managed_key_enabled = false  # bool | optional
    kms_key_arn                  = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

