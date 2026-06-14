# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_folder_organization_policy                       │
# └──────────────────────────────────────────────────────────────┘
data "google_folder_organization_policy" "this" {

  constraint     = ""     # string | required | The name of the Constraint the Policy is configuring, for ex…
  folder         = ""     # string | required | The resource name of the folder to set the policy for. Its f…
  id             = ""     # string | optional+computed

  # boolean_policy = [  # list(object)
  #   {
  #     enforced = false
  #   }
  # ]
  # etag           = ""     # string | computed | The etag of the organization policy. etag is used for optimi…
  # list_policy = [  # list(object)
  #   {
  #     allow = [  # list(object)
  #       {
  #         all = false
  #         values = []  # set(string)
  #       }
  #     ]
  #     deny = [  # list(object)
  #       {
  #         all = false
  #         values = []  # set(string)
  #       }
  #     ]
  #     inherit_from_parent = false
  #     suggested_value = ""
  #   }
  # ]
  # restore_policy = [  # list(object)
  #   {
  #     default = false
  #   }
  # ]
  # update_time    = ""     # string | computed | The timestamp in RFC3339 UTC "Zulu" format, accurate to nano…
  # version        = 0      # number | computed | Version of the Policy. Default version is 0.

}

