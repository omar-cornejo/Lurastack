# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_brand                                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_brand" "this" {

  application_title = ""     # string | required | Application name displayed on OAuth consent screen.
  support_email     = ""     # string | required | Support email displayed on the OAuth consent screen. Can be …
  id                = ""     # string | optional+computed
  project           = ""     # string | optional+computed

  # name              = ""     # string | computed | Output only. Identifier of the brand, in the format 'project…
  # org_internal_only = false  # bool | computed | Whether the brand is only intended for usage inside the GSui…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

