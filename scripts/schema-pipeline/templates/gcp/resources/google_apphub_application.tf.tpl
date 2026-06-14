# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apphub_application                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_apphub_application" "this" {

  application_id = ""     # string | required | Required. The Application identifier.
  location       = ""     # string | required | Part of 'parent'. See documentation of 'projectsId'.
  description    = ""     # string | optional | Optional. User-defined description of an Application.
  display_name   = ""     # string | optional | Optional. User-defined name for the Application.
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # create_time    = ""     # string | computed | Output only. Create time.
  # name           = ""     # string | computed | Identifier. The resource name of an Application. Format: "pr…
  # state          = ""     # string | computed | Output only. Application state.   Possible values:  STATE_UN…
  # uid            = ""     # string | computed | Output only. A universally unique identifier (in UUID4 forma…
  # update_time    = ""     # string | computed | Output only. Update time.

  attributes { # list [0..1]

    business_owners { # list
      email        = ""     # string | required | Required. Email address of the contacts.
      display_name = ""     # string | optional | Optional. Contact's name.

    }

    criticality { # list [0..1]
      type = ""     # string | required | Criticality type. Possible values: ["MISSION_CRITICAL", "HIG…

    }

    developer_owners { # list
      email        = ""     # string | required | Required. Email address of the contacts.
      display_name = ""     # string | optional | Optional. Contact's name.

    }

    environment { # list [0..1]
      type = ""     # string | required | Environment type. Possible values: ["PRODUCTION", "STAGING",…

    }

    operator_owners { # list
      email        = ""     # string | required | Required. Email address of the contacts.
      display_name = ""     # string | optional | Optional. Contact's name.

    }

  }

  scope { # list [1..1]
    type = ""     # string | required | Required. Scope Type.   Possible values: REGIONAL Possible v…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

