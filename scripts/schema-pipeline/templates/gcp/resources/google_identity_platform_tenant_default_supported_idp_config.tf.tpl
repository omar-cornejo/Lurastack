# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_identity_platform_tenant_default_supported_idp_config  │
# └──────────────────────────────────────────────────────────────┘
resource "google_identity_platform_tenant_default_supported_idp_config" "this" {

  client_id     = ""     # string | required | OAuth client ID
  client_secret = ""     # string | required | OAuth client secret
  idp_id        = ""     # string | required | ID of the IDP. Possible values include:  * 'apple.com'  * 'f…
  tenant        = ""     # string | required | The name of the tenant where this DefaultSupportedIdpConfig …
  enabled       = false  # bool | optional | If this IDP allows the user to sign in
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # name          = ""     # string | computed | The name of the default supported IDP config resource

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

