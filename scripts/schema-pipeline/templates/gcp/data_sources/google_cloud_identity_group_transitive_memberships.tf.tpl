# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_identity_group_transitive_memberships      │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_identity_group_transitive_memberships" "this" {

  group       = ""     # string | required | The name of the Group to get memberships from.
  id          = ""     # string | optional+computed

  # memberships = [  # list(object)
  #   {
  #     member = ""
  #     preferred_member_key = [  # list(object)
  #       {
  #         id = ""
  #         namespace = ""
  #       }
  #     ]
  #     relation_type = ""
  #     roles = [  # set(object)
  #       {
  #         role = ""
  #       }
  #     ]
  #   }
  # ]

}

