# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_service_perimeters    │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_service_perimeters" "this" {

  parent = ""     # string | required | The AccessPolicy this ServicePerimeter lives in. Format: acc…
  id     = ""     # string | optional+computed

  service_perimeters { # list
    name                      = ""     # string | required | Resource name for the ServicePerimeter. The short_name compo…
    title                     = ""     # string | required | Human readable title. Must be unique within the Policy.
    description               = ""     # string | optional | Description of the ServicePerimeter and its use. Does not af…
    perimeter_type            = ""     # string | optional | Specifies the type of the Perimeter. There are two types: re…
    use_explicit_dry_run_spec = false  # bool | optional | Use explicit dry run spec flag. Ordinarily, a dry-run spec i…

    # create_time               = ""     # string | computed | Time the AccessPolicy was created in UTC.
    # update_time               = ""     # string | computed | Time the AccessPolicy was updated in UTC.

    spec { # list [0..1]
      access_levels       = []     # set(string) | optional | A list of AccessLevel resource names that allow resources wi…
      resources           = []     # set(string) | optional | A list of GCP resources that are inside of the service perim…
      restricted_services = []     # set(string) | optional | GCP services that are subject to the Service Perimeter restr…

      egress_policies { # list

        egress_from { # list [0..1]
          identities         = []     # set(string) | optional | A list of identities that are allowed access through this 'E…
          identity_type      = ""     # string | optional | Specifies the type of identities that are allowed access to …
          source_restriction = ""     # string | optional | Whether to enforce traffic restrictions based on 'sources' f…

          sources { # list
            access_level = ""     # string | optional | An AccessLevel resource name that allows resources outside t…

          }

        }

        egress_to { # list [0..1]
          external_resources = []     # set(string) | optional | A list of external resources that are allowed to be accessed…
          resources          = []     # set(string) | optional | A list of resources, currently only projects in the form 'pr…

          operations { # list
            service_name = ""     # string | optional | The name of the API whose methods or permissions the 'Ingres…

            method_selectors { # list
              method     = ""     # string | optional | Value for 'method' should be a valid method name for the cor…
              permission = ""     # string | optional | Value for permission should be a valid Cloud IAM permission …

            }

          }

        }

      }

      ingress_policies { # list

        ingress_from { # list [0..1]
          identities    = []     # set(string) | optional | A list of identities that are allowed access through this in…
          identity_type = ""     # string | optional | Specifies the type of identities that are allowed access fro…

          sources { # list
            access_level = ""     # string | optional | An 'AccessLevel' resource name that allow resources within t…
            resource     = ""     # string | optional | A Google Cloud resource that is allowed to ingress the perim…

          }

        }

        ingress_to { # list [0..1]
          resources = []     # set(string) | optional | A list of resources, currently only projects in the form 'pr…

          operations { # list
            service_name = ""     # string | optional | The name of the API whose methods or permissions the 'Ingres…

            method_selectors { # list
              method     = ""     # string | optional | Value for method should be a valid method name for the corre…
              permission = ""     # string | optional | Value for permission should be a valid Cloud IAM permission …

            }

          }

        }

      }

      vpc_accessible_services { # list [0..1]
        allowed_services   = []     # set(string) | optional | The list of APIs usable within the Service Perimeter. Must b…
        enable_restriction = false  # bool | optional | Whether to restrict API calls within the Service Perimeter t…

      }

    }

    status { # list [0..1]
      access_levels       = []     # set(string) | optional | A list of AccessLevel resource names that allow resources wi…
      resources           = []     # set(string) | optional | A list of GCP resources that are inside of the service perim…
      restricted_services = []     # set(string) | optional | GCP services that are subject to the Service Perimeter restr…

      egress_policies { # list

        egress_from { # list [0..1]
          identities         = []     # set(string) | optional | A list of identities that are allowed access through this 'E…
          identity_type      = ""     # string | optional | Specifies the type of identities that are allowed access to …
          source_restriction = ""     # string | optional | Whether to enforce traffic restrictions based on 'sources' f…

          sources { # list
            access_level = ""     # string | optional | An AccessLevel resource name that allows resources outside t…

          }

        }

        egress_to { # list [0..1]
          external_resources = []     # set(string) | optional | A list of external resources that are allowed to be accessed…
          resources          = []     # set(string) | optional | A list of resources, currently only projects in the form 'pr…

          operations { # list
            service_name = ""     # string | optional | The name of the API whose methods or permissions the 'Ingres…

            method_selectors { # list
              method     = ""     # string | optional | Value for 'method' should be a valid method name for the cor…
              permission = ""     # string | optional | Value for permission should be a valid Cloud IAM permission …

            }

          }

        }

      }

      ingress_policies { # set

        ingress_from { # list [0..1]
          identities    = []     # set(string) | optional | A list of identities that are allowed access through this in…
          identity_type = ""     # string | optional | Specifies the type of identities that are allowed access fro…

          sources { # list
            access_level = ""     # string | optional | An 'AccessLevel' resource name that allow resources within t…
            resource     = ""     # string | optional | A Google Cloud resource that is allowed to ingress the perim…

          }

        }

        ingress_to { # list [0..1]
          resources = []     # set(string) | optional | A list of resources, currently only projects in the form 'pr…

          operations { # list
            service_name = ""     # string | optional | The name of the API whose methods or permissions the 'Ingres…

            method_selectors { # list
              method     = ""     # string | optional | Value for method should be a valid method name for the corre…
              permission = ""     # string | optional | Value for permission should be a valid Cloud IAM permission …

            }

          }

        }

      }

      vpc_accessible_services { # list [0..1]
        allowed_services   = []     # set(string) | optional | The list of APIs usable within the Service Perimeter. Must b…
        enable_restriction = false  # bool | optional | Whether to restrict API calls within the Service Perimeter t…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

