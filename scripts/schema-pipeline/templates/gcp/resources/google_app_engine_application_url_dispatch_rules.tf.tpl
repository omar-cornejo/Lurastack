# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_application_url_dispatch_rules    │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_application_url_dispatch_rules" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  dispatch_rules { # list [1..*]
    path    = ""     # string | required | Pathname within the host. Must start with a "/". A single "*…
    service = ""     # string | required | Pathname within the host. Must start with a "/". A single "*…
    domain  = ""     # string | optional | Domain name to match against. The wildcard "*" is supported …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

