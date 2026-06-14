# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_domain_name_access_association      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_domain_name_access_association" "this" {

  access_association_source      = ""     # string | required
  access_association_source_type = ""     # string | required
  domain_name_arn                = ""     # string | required
  tags                           = {}     # map(string) | optional

  # arn                            = ""     # string | computed
  # id                             = ""     # string | computed+DEPRECATED
  # tags_all                       = {}     # map(string) | computed

}

