# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_account_primary_contact                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_account_primary_contact" "this" {

  address_line_1     = ""     # string | required
  city               = ""     # string | required
  country_code       = ""     # string | required
  full_name          = ""     # string | required
  phone_number       = ""     # string | required
  postal_code        = ""     # string | required
  account_id         = ""     # string | optional
  address_line_2     = ""     # string | optional
  address_line_3     = ""     # string | optional
  company_name       = ""     # string | optional
  district_or_county = ""     # string | optional
  id                 = ""     # string | optional+computed
  state_or_region    = ""     # string | optional
  website_url        = ""     # string | optional

}

