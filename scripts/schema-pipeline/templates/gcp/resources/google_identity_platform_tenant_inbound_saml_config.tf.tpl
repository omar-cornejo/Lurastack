# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_identity_platform_tenant_inbound_saml_config  │
# └──────────────────────────────────────────────────────────────┘
resource "google_identity_platform_tenant_inbound_saml_config" "this" {

  display_name = ""     # string | required | Human friendly display name.
  name         = ""     # string | required | The name of the InboundSamlConfig resource. Must start with …
  tenant       = ""     # string | required | The name of the tenant where this inbound SAML config resour…
  enabled      = false  # bool | optional | If this config allows users to sign in with the provider.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  idp_config { # list [1..1]
    idp_entity_id = ""     # string | required | Unique identifier for all SAML entities
    sso_url       = ""     # string | required | URL to send Authentication request to.
    sign_request  = false  # bool | optional | Indicates if outbounding SAMLRequest should be signed.

    idp_certificates { # list [1..*]
      x509_certificate = ""     # string | optional | The x509 certificate

    }

  }

  sp_config { # list [1..1]
    callback_uri    = ""     # string | required | Callback URI where responses from IDP are handled. Must star…
    sp_entity_id    = ""     # string | required | Unique identifier for all SAML entities.

    # sp_certificates = [  # list(object)
    #   {
    #     x509_certificate = ""
    #   }
    # ]

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

