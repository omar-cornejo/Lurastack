# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_identity_pool                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_identity_pool" "this" {

  identity_pool_name               = ""     # string | required
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional+computed

  # allow_classic_flow               = false  # bool | computed
  # allow_unauthenticated_identities = false  # bool | computed
  # arn                              = ""     # string | computed
  # cognito_identity_providers = [  # set(object)
  #   {
  #     client_id = ""
  #     provider_name = ""
  #     server_side_token_check = false
  #   }
  # ]
  # developer_provider_name          = ""     # string | computed
  # openid_connect_provider_arns     = []     # set(string) | computed
  # saml_provider_arns               = []     # list(string) | computed
  # supported_login_providers        = {}     # map(string) | computed

}

