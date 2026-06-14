# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_apphub_application                               │
# └──────────────────────────────────────────────────────────────┘
data "google_apphub_application" "this" {

  application_id = ""     # string | required | Required. The Application identifier.
  location       = ""     # string | required | Part of 'parent'. See documentation of 'projectsId'.
  project        = ""     # string | required
  id             = ""     # string | optional+computed

  # attributes = [  # list(object)
  #   {
  #     business_owners = [  # list(object)
  #       {
  #         display_name = ""
  #         email = ""
  #       }
  #     ]
  #     criticality = [  # list(object)
  #       {
  #         type = ""
  #       }
  #     ]
  #     developer_owners = [  # list(object)
  #       {
  #         display_name = ""
  #         email = ""
  #       }
  #     ]
  #     environment = [  # list(object)
  #       {
  #         type = ""
  #       }
  #     ]
  #     operator_owners = [  # list(object)
  #       {
  #         display_name = ""
  #         email = ""
  #       }
  #     ]
  #   }
  # ]
  # create_time    = ""     # string | computed | Output only. Create time.
  # description    = ""     # string | computed | Optional. User-defined description of an Application.
  # display_name   = ""     # string | computed | Optional. User-defined name for the Application.
  # name           = ""     # string | computed | Identifier. The resource name of an Application. Format: "pr…
  # scope = [  # list(object)
  #   {
  #     type = ""
  #   }
  # ]
  # state          = ""     # string | computed | Output only. Application state.   Possible values:  STATE_UN…
  # uid            = ""     # string | computed | Output only. A universally unique identifier (in UUID4 forma…
  # update_time    = ""     # string | computed | Output only. Update time.

}

