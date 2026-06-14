# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_customerprofiles_profile                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_customerprofiles_profile" "this" {

  domain_name            = ""     # string | required
  account_number         = ""     # string | optional
  additional_information = ""     # string | optional
  attributes             = {}     # map(string) | optional
  birth_date             = ""     # string | optional
  business_email_address = ""     # string | optional
  business_name          = ""     # string | optional
  business_phone_number  = ""     # string | optional
  email_address          = ""     # string | optional
  first_name             = ""     # string | optional
  gender_string          = ""     # string | optional
  home_phone_number      = ""     # string | optional
  id                     = ""     # string | optional+computed
  last_name              = ""     # string | optional
  middle_name            = ""     # string | optional
  mobile_phone_number    = ""     # string | optional
  party_type_string      = ""     # string | optional
  personal_email_address = ""     # string | optional
  phone_number           = ""     # string | optional

  address { # list [0..1]
    address_1   = ""     # string | optional
    address_2   = ""     # string | optional
    address_3   = ""     # string | optional
    address_4   = ""     # string | optional
    city        = ""     # string | optional
    country     = ""     # string | optional
    county      = ""     # string | optional
    postal_code = ""     # string | optional
    province    = ""     # string | optional
    state       = ""     # string | optional

  }

  billing_address { # list [0..1]
    address_1   = ""     # string | optional
    address_2   = ""     # string | optional
    address_3   = ""     # string | optional
    address_4   = ""     # string | optional
    city        = ""     # string | optional
    country     = ""     # string | optional
    county      = ""     # string | optional
    postal_code = ""     # string | optional
    province    = ""     # string | optional
    state       = ""     # string | optional

  }

  mailing_address { # list [0..1]
    address_1   = ""     # string | optional
    address_2   = ""     # string | optional
    address_3   = ""     # string | optional
    address_4   = ""     # string | optional
    city        = ""     # string | optional
    country     = ""     # string | optional
    county      = ""     # string | optional
    postal_code = ""     # string | optional
    province    = ""     # string | optional
    state       = ""     # string | optional

  }

  shipping_address { # list [0..1]
    address_1   = ""     # string | optional
    address_2   = ""     # string | optional
    address_3   = ""     # string | optional
    address_4   = ""     # string | optional
    city        = ""     # string | optional
    country     = ""     # string | optional
    county      = ""     # string | optional
    postal_code = ""     # string | optional
    province    = ""     # string | optional
    state       = ""     # string | optional

  }

}

