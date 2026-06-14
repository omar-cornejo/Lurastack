# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_identity_provider                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_identity_provider" "this" {

  provider_details  = {}     # map(string) | required
  provider_name     = ""     # string | required
  provider_type     = ""     # string | required
  user_pool_id      = ""     # string | required
  attribute_mapping = {}     # map(string) | optional+computed
  id                = ""     # string | optional+computed
  idp_identifiers   = []     # list(string) | optional

}

