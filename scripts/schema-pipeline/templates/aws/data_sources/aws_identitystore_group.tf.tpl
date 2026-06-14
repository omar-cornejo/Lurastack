# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_identitystore_group                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_identitystore_group" "this" {

  identity_store_id = ""     # string | required
  group_id          = ""     # string | optional+computed
  id                = ""     # string | optional+computed

  # description       = ""     # string | computed
  # display_name      = ""     # string | computed
  # external_ids = [  # list(object)
  #   {
  #     id = ""
  #     issuer = ""
  #   }
  # ]

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

