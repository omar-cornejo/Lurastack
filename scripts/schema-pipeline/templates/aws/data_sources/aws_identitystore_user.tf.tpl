# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_identitystore_user                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_identitystore_user" "this" {

  identity_store_id  = ""     # string | required
  id                 = ""     # string | optional+computed
  user_id            = ""     # string | optional+computed

  # addresses = [  # list(object)
  #   {
  #     country = ""
  #     formatted = ""
  #     locality = ""
  #     postal_code = ""
  #     primary = false
  #     region = ""
  #     street_address = ""
  #     type = ""
  #   }
  # ]
  # display_name       = ""     # string | computed
  # emails = [  # list(object)
  #   {
  #     primary = false
  #     type = ""
  #     value = ""
  #   }
  # ]
  # external_ids = [  # list(object)
  #   {
  #     id = ""
  #     issuer = ""
  #   }
  # ]
  # locale             = ""     # string | computed
  # name = [  # list(object)
  #   {
  #     family_name = ""
  #     formatted = ""
  #     given_name = ""
  #     honorific_prefix = ""
  #     honorific_suffix = ""
  #     middle_name = ""
  #   }
  # ]
  # nickname           = ""     # string | computed
  # phone_numbers = [  # list(object)
  #   {
  #     primary = false
  #     type = ""
  #     value = ""
  #   }
  # ]
  # preferred_language = ""     # string | computed
  # profile_url        = ""     # string | computed
  # timezone           = ""     # string | computed
  # title              = ""     # string | computed
  # user_name          = ""     # string | computed
  # user_type          = ""     # string | computed

  alternate_identifier { # list [0..1]

    external_id { # list [0..1]
      id     = ""     # string | required
      issuer = ""     # string | required

    }

    unique_attribute { # list [0..1]
      attribute_path  = ""     # string | required
      attribute_value = ""     # string | required

    }

  }

  filter { # list [0..1] DEPRECATED
    attribute_path  = ""     # string | required
    attribute_value = ""     # string | required

  }

}

