# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_identity_group_memberships                 │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_identity_group_memberships" "this" {

  group       = ""     # string | required | The name of the Group to get memberships from.
  id          = ""     # string | optional+computed

  # memberships = [  # list(object)
  #   {
  #     create_time = ""
  #     group = ""
  #     name = ""
  #     preferred_member_key = [  # list(object)
  #       {
  #         id = ""
  #         namespace = ""
  #       }
  #     ]
  #     roles = [  # set(object)
  #       {
  #         expiry_detail = [  # list(object)
  #           {
  #             expire_time = ""
  #           }
  #         ]
  #         name = ""
  #       }
  #     ]
  #     type = ""
  #     update_time = ""
  #   }
  # ]

}

