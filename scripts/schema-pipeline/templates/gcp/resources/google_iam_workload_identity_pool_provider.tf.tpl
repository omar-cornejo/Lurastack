# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iam_workload_identity_pool_provider          │
# └──────────────────────────────────────────────────────────────┘
resource "google_iam_workload_identity_pool_provider" "this" {

  workload_identity_pool_id          = ""     # string | required | The ID used for the pool, which is the final component of th…
  workload_identity_pool_provider_id = ""     # string | required | The ID for the provider, which becomes the final component o…
  attribute_condition                = ""     # string | optional | [A Common Expression Language](https://opensource.google/pro…
  attribute_mapping                  = {}     # map(string) | optional | Maps attributes from authentication credentials issued by an…
  description                        = ""     # string | optional | A description for the provider. Cannot exceed 256 characters…
  disabled                           = false  # bool | optional | Whether the provider is disabled. You cannot use a disabled …
  display_name                       = ""     # string | optional | A display name for the provider. Cannot exceed 32 characters…
  id                                 = ""     # string | optional+computed
  project                            = ""     # string | optional+computed

  # name                               = ""     # string | computed | The resource name of the provider as 'projects/{project_numb…
  # state                              = ""     # string | computed | The state of the provider. * STATE_UNSPECIFIED: State unspec…

  aws { # list [0..1]
    account_id = ""     # string | required | The AWS account ID.

  }

  oidc { # list [0..1]
    issuer_uri        = ""     # string | required | The OIDC issuer URL.
    allowed_audiences = []     # list(string) | optional | Acceptable values for the 'aud' field (audience) in the OIDC…
    jwks_json         = ""     # string | optional | OIDC JWKs in JSON String format. For details on definition o…

  }

  saml { # list [0..1]
    idp_metadata_xml = ""     # string | required | SAML Identity provider configuration metadata xml doc.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

