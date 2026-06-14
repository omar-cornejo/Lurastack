# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_identitystore_users                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_identitystore_users" "this" {

  identity_store_id = ""     # string | required

  # users = [  # list(object)
  #   {
  #     addresses = [  # list(object)
  #       {
  #         country = ""
  #         formatted = ""
  #         locality = ""
  #         postal_code = ""
  #         primary = false
  #         region = ""
  #         street_address = ""
  #         type = ""
  #       }
  #     ]
  #     display_name = ""
  #     emails = [  # list(object)
  #       {
  #         primary = false
  #         type = ""
  #         value = ""
  #       }
  #     ]
  #     external_ids = [  # list(object)
  #       {
  #         id = ""
  #         issuer = ""
  #       }
  #     ]
  #     identity_store_id = ""
  #     locale = ""
  #     name = [  # list(object)
  #       {
  #         family_name = ""
  #         formatted = ""
  #         given_name = ""
  #         honorific_prefix = ""
  #         honorific_suffix = ""
  #         middle_name = ""
  #       }
  #     ]
  #     nickname = ""
  #     phone_numbers = [  # list(object)
  #       {
  #         primary = false
  #         type = ""
  #         value = ""
  #       }
  #     ]
  #     preferred_language = ""
  #     profile_url = ""
  #     timezone = ""
  #     title = ""
  #     user_id = ""
  #     user_name = ""
  #     user_type = ""
  #   }
  # ]

}

