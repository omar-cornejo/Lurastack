# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_site_verification_token                          │
# └──────────────────────────────────────────────────────────────┘
data "google_site_verification_token" "this" {

  identifier          = ""     # string | required | The site identifier. If the type is set to SITE, the identif…
  type                = ""     # string | required | The type of resource to be verified, either a domain or a we…
  verification_method = ""     # string | required | The verification method for the Site Verification system to …
  id                  = ""     # string | optional+computed

  # token               = ""     # string | computed | The returned token for use in subsequent verification steps.

  timeouts { # single
    read = ""     # string | optional

  }

}

