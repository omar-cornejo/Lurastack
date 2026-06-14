# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_service_perimeter_dry_run_ingress_policy  │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_service_perimeter_dry_run_ingress_policy" "this" {

  perimeter = ""     # string | required | The name of the Service Perimeter to add this resource to.
  id        = ""     # string | optional+computed

  ingress_from { # list [0..1]
    identities    = []     # list(string) | optional | A list of identities that are allowed access through this in…
    identity_type = ""     # string | optional | Specifies the type of identities that are allowed access fro…

    sources { # list
      access_level = ""     # string | optional | An 'AccessLevel' resource name that allow resources within t…
      resource     = ""     # string | optional | A Google Cloud resource that is allowed to ingress the perim…

    }

  }

  ingress_to { # list [0..1]
    resources = []     # list(string) | optional | A list of resources, currently only projects in the form 'pr…

    operations { # list
      service_name = ""     # string | optional | The name of the API whose methods or permissions the 'Ingres…

      method_selectors { # list
        method     = ""     # string | optional | Value for method should be a valid method name for the corre…
        permission = ""     # string | optional | Value for permission should be a valid Cloud IAM permission …

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

