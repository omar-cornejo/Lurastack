# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_service_perimeter_egress_policy  │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_service_perimeter_egress_policy" "this" {

  perimeter = ""     # string | required | The name of the Service Perimeter to add this resource to.
  id        = ""     # string | optional+computed

  egress_from { # list [0..1]
    identities         = []     # list(string) | optional | A list of identities that are allowed access through this 'E…
    identity_type      = ""     # string | optional | Specifies the type of identities that are allowed access to …
    source_restriction = ""     # string | optional | Whether to enforce traffic restrictions based on 'sources' f…

    sources { # list
      access_level = ""     # string | optional | An AccessLevel resource name that allows resources outside t…

    }

  }

  egress_to { # list [0..1]
    external_resources = []     # list(string) | optional | A list of external resources that are allowed to be accessed…
    resources          = []     # list(string) | optional | A list of resources, currently only projects in the form 'pr…

    operations { # list
      service_name = ""     # string | optional | The name of the API whose methods or permissions the 'Ingres…

      method_selectors { # list
        method     = ""     # string | optional | Value for 'method' should be a valid method name for the cor…
        permission = ""     # string | optional | Value for permission should be a valid Cloud IAM permission …

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

