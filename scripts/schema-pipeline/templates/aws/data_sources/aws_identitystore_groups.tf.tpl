# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_identitystore_groups                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_identitystore_groups" "this" {

  identity_store_id = ""     # string | required

  # groups = [  # list(object)
  #   {
  #     description = ""
  #     display_name = ""
  #     external_ids = [  # list(object)
  #       {
  #         id = ""
  #         issuer = ""
  #       }
  #     ]
  #     group_id = ""
  #     identity_store_id = ""
  #   }
  # ]

}

