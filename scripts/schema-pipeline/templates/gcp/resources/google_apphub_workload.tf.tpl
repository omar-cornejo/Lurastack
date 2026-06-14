# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apphub_workload                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_apphub_workload" "this" {

  application_id      = ""     # string | required | Part of 'parent'.  Full resource name of a parent Applicatio…
  discovered_workload = ""     # string | required | Immutable. The resource name of the original discovered work…
  location            = ""     # string | required | Part of 'parent'.  Full resource name of a parent Applicatio…
  workload_id         = ""     # string | required | The Workload identifier.
  description         = ""     # string | optional | User-defined description of a Workload.
  display_name        = ""     # string | optional | User-defined name for the Workload.
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed

  # create_time         = ""     # string | computed | Output only. Create time.
  # name                = ""     # string | computed | Identifier. The resource name of the Workload. Format:"proje…
  # state               = ""     # string | computed | Output only. Workload state. Possible values:  STATE_UNSPECI…
  # uid                 = ""     # string | computed | Output only. A universally unique identifier (UUID) for the …
  # update_time         = ""     # string | computed | Output only. Update time.
  # workload_properties = [  # list(object)
  #   {
  #     gcp_project = ""
  #     location = ""
  #     zone = ""
  #   }
  # ]
  # workload_reference = [  # list(object)
  #   {
  #     uri = ""
  #   }
  # ]

  attributes { # list [0..1]

    business_owners { # list
      email        = ""     # string | required | Email address of the contacts.
      display_name = ""     # string | optional | Contact's name.

    }

    criticality { # list [0..1]
      type = ""     # string | required | Criticality type. Possible values: ["MISSION_CRITICAL", "HIG…

    }

    developer_owners { # list
      email        = ""     # string | required | Email address of the contacts.
      display_name = ""     # string | optional | Contact's name.

    }

    environment { # list [0..1]
      type = ""     # string | required | Environment type. Possible values: ["PRODUCTION", "STAGING",…

    }

    operator_owners { # list
      email        = ""     # string | required | Email address of the contacts.
      display_name = ""     # string | optional | Contact's name.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

