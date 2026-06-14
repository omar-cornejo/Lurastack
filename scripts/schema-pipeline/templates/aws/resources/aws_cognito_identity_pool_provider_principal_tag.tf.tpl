# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_identity_pool_provider_principal_tag    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_identity_pool_provider_principal_tag" "this" {

  identity_pool_id       = ""     # string | required
  identity_provider_name = ""     # string | required
  id                     = ""     # string | optional+computed
  principal_tags         = {}     # map(string) | optional
  use_defaults           = false  # bool | optional

}

