# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_identitystore_group_memberships                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_identitystore_group_memberships" "this" {

  group_id          = ""     # string | required
  identity_store_id = ""     # string | required

  # group_memberships = [  # list(object)
  #   {
  #     group_id = ""
  #     identity_store_id = ""
  #     member_id = {
  #       user_id = ""
  #     }
  #     membership_id = ""
  #   }
  # ]

}

