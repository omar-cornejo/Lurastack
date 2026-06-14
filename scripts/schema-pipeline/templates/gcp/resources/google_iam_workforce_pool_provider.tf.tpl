# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iam_workforce_pool_provider                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_iam_workforce_pool_provider" "this" {

  location            = ""     # string | required | The location for the resource.
  provider_id         = ""     # string | required | The ID for the provider, which becomes the final component o…
  workforce_pool_id   = ""     # string | required | The ID to use for the pool, which becomes the final componen…
  attribute_condition = ""     # string | optional | A [Common Expression Language](https://opensource.google/pro…
  attribute_mapping   = {}     # map(string) | optional | Maps attributes from the authentication credentials issued b…
  description         = ""     # string | optional | A user-specified description of the provider. Cannot exceed …
  disabled            = false  # bool | optional | Whether the provider is disabled. You cannot use a disabled …
  display_name        = ""     # string | optional | A user-specified display name for the provider. Cannot excee…
  id                  = ""     # string | optional+computed

  # name                = ""     # string | computed | Output only. The resource name of the provider. Format: 'loc…
  # state               = ""     # string | computed | The current state of the provider. * STATE_UNSPECIFIED: Stat…

  extra_attributes_oauth2_client { # list [0..1]
    attributes_type = ""     # string | required | Represents the IdP and type of claims that should be fetched…
    client_id       = ""     # string | required | The OAuth 2.0 client ID for retrieving extra attributes from…
    issuer_uri      = ""     # string | required | The OIDC identity provider's issuer URI. Must be a valid URI…

    client_secret { # list [1..1]

      value { # list [0..1]
        plain_text = ""     # string | required | The plain text of the client secret value.

        # thumbprint = ""     # string | computed | A thumbprint to represent the current client secret value.

      }

    }

    query_parameters { # list [0..1]
      filter = ""     # string | optional | The filter used to request specific records from IdP. In cas…

    }

  }

  oidc { # list [0..1]
    client_id  = ""     # string | required | The client ID. Must match the audience claim of the JWT issu…
    issuer_uri = ""     # string | required | The OIDC issuer URI. Must be a valid URI using the 'https' s…
    jwks_json  = ""     # string | optional | OIDC JWKs in JSON String format. For details on definition o…

    client_secret { # list [0..1]

      value { # list [0..1]
        plain_text = ""     # string | required+sensitive | The plain text of the client secret value.

        # thumbprint = ""     # string | computed | A thumbprint to represent the current client secret value.

      }

    }

    web_sso_config { # list [0..1]
      assertion_claims_behavior = ""     # string | required | The behavior for how OIDC Claims are included in the 'assert…
      response_type             = ""     # string | required | The Response Type to request for in the OIDC Authorization R…
      additional_scopes         = []     # list(string) | optional | Additional scopes to request for in the OIDC authentication …

    }

  }

  saml { # list [0..1]
    idp_metadata_xml = ""     # string | required | SAML Identity provider configuration metadata xml doc. The x…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

