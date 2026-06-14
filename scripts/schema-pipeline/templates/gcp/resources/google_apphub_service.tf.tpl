# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apphub_service                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_apphub_service" "this" {

  application_id     = ""     # string | required | Part of 'parent'.  Full resource name of a parent Applicatio…
  discovered_service = ""     # string | required | Immutable. The resource name of the original discovered serv…
  location           = ""     # string | required | Part of 'parent'.  Full resource name of a parent Applicatio…
  service_id         = ""     # string | required | The Service identifier.
  description        = ""     # string | optional | User-defined description of a Service.
  display_name       = ""     # string | optional | User-defined name for the Service.
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed

  # create_time        = ""     # string | computed | Output only. Create time.
  # name               = ""     # string | computed | Identifier. The resource name of a Service. Format: "project…
  # service_properties = [  # list(object)
  #   {
  #     gcp_project = ""
  #     location = ""
  #     zone = ""
  #   }
  # ]
  # service_reference = [  # list(object)
  #   {
  #     uri = ""
  #   }
  # ]
  # state              = ""     # string | computed | Output only. Service state. Possible values: STATE_UNSPECIFI…
  # uid                = ""     # string | computed | Output only. A universally unique identifier (UUID) for the …
  # update_time        = ""     # string | computed | Output only. Update time.

  attributes { # list [0..1]

    business_owners { # list
      email        = ""     # string | required | Required. Email address of the contacts.
      display_name = ""     # string | optional | Contact's name.

    }

    criticality { # list [0..1]
      type = ""     # string | required | Criticality type. Possible values: ["MISSION_CRITICAL", "HIG…

    }

    developer_owners { # list
      email        = ""     # string | required | Required. Email address of the contacts.
      display_name = ""     # string | optional | Contact's name.

    }

    environment { # list [0..1]
      type = ""     # string | required | Environment type. Possible values: ["PRODUCTION", "STAGING",…

    }

    operator_owners { # list
      email        = ""     # string | required | Required. Email address of the contacts.
      display_name = ""     # string | optional | Contact's name.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

