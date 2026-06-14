# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_identity_platform_oauth_idp_config           │
# └──────────────────────────────────────────────────────────────┘
resource "google_identity_platform_oauth_idp_config" "this" {

  client_id     = ""     # string | required | The client id of an OAuth client.
  issuer        = ""     # string | required | For OIDC Idps, the issuer identifier.
  name          = ""     # string | required | The name of the OauthIdpConfig. Must start with 'oidc.'.
  client_secret = ""     # string | optional | The client secret of the OAuth client, to enable OIDC code f…
  display_name  = ""     # string | optional | Human friendly display name.
  enabled       = false  # bool | optional | If this config allows users to sign in with the provider.
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

