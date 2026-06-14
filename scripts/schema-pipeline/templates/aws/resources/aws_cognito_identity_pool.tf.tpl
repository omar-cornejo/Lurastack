# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_identity_pool                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_identity_pool" "this" {

  identity_pool_name               = ""     # string | required
  allow_classic_flow               = false  # bool | optional
  allow_unauthenticated_identities = false  # bool | optional
  developer_provider_name          = ""     # string | optional
  id                               = ""     # string | optional+computed
  openid_connect_provider_arns     = []     # set(string) | optional
  saml_provider_arns               = []     # list(string) | optional
  supported_login_providers        = {}     # map(string) | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed

  cognito_identity_providers { # set
    client_id               = ""     # string | optional
    provider_name           = ""     # string | optional
    server_side_token_check = false  # bool | optional

  }

}

