# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_identitystore_user                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_identitystore_user" "this" {

  display_name       = ""     # string | required
  identity_store_id  = ""     # string | required
  user_name          = ""     # string | required
  id                 = ""     # string | optional+computed
  locale             = ""     # string | optional
  nickname           = ""     # string | optional
  preferred_language = ""     # string | optional
  profile_url        = ""     # string | optional
  timezone           = ""     # string | optional
  title              = ""     # string | optional
  user_type          = ""     # string | optional

  # external_ids = [  # list(object)
  #   {
  #     id = ""
  #     issuer = ""
  #   }
  # ]
  # user_id            = ""     # string | computed

  addresses { # list [0..1]
    country        = ""     # string | optional
    formatted      = ""     # string | optional
    locality       = ""     # string | optional
    postal_code    = ""     # string | optional
    primary        = false  # bool | optional
    region         = ""     # string | optional
    street_address = ""     # string | optional
    type           = ""     # string | optional

  }

  emails { # list [0..1]
    primary = false  # bool | optional
    type    = ""     # string | optional
    value   = ""     # string | optional

  }

  name { # list [1..1]
    family_name      = ""     # string | required
    given_name       = ""     # string | required
    formatted        = ""     # string | optional
    honorific_prefix = ""     # string | optional
    honorific_suffix = ""     # string | optional
    middle_name      = ""     # string | optional

  }

  phone_numbers { # list [0..1]
    primary = false  # bool | optional
    type    = ""     # string | optional
    value   = ""     # string | optional

  }

}

