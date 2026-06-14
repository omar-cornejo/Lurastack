# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_account_primary_contact                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_account_primary_contact" "this" {

  account_id         = ""     # string | optional+computed

  # address_line_1     = ""     # string | computed
  # address_line_2     = ""     # string | computed
  # address_line_3     = ""     # string | computed
  # city               = ""     # string | computed
  # company_name       = ""     # string | computed
  # country_code       = ""     # string | computed
  # district_or_county = ""     # string | computed
  # full_name          = ""     # string | computed
  # phone_number       = ""     # string | computed
  # postal_code        = ""     # string | computed
  # state_or_region    = ""     # string | computed
  # website_url        = ""     # string | computed

}

