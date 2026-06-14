# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_domain_mapping                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_domain_mapping" "this" {

  domain_name       = ""     # string | required | Relative name of the domain serving the application. Example…
  id                = ""     # string | optional+computed
  override_strategy = ""     # string | optional | Whether the domain creation should override any existing map…
  project           = ""     # string | optional+computed

  # name              = ""     # string | computed | Full path to the DomainMapping resource in the API. Example:…
  # resource_records = [  # list(object)
  #   {
  #     name = ""
  #     rrdata = ""
  #     type = ""
  #   }
  # ]

  ssl_settings { # list [0..1]
    ssl_management_type            = ""     # string | required | SSL management type for this domain. If 'AUTOMATIC', a manag…
    certificate_id                 = ""     # string | optional+computed | ID of the AuthorizedCertificate resource configuring SSL for…

    # pending_managed_certificate_id = ""     # string | computed | ID of the managed 'AuthorizedCertificate' resource currently…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

