# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_managed_user_pool_client                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_managed_user_pool_client" "this" {

  user_pool_id                                  = ""     # string | required
  access_token_validity                         = 0      # number | optional+computed
  allowed_oauth_flows                           = []     # set(string) | optional+computed
  allowed_oauth_flows_user_pool_client          = false  # bool | optional+computed
  allowed_oauth_scopes                          = []     # set(string) | optional+computed
  auth_session_validity                         = 0      # number | optional+computed
  callback_urls                                 = []     # set(string) | optional+computed
  default_redirect_uri                          = ""     # string | optional+computed
  enable_propagate_additional_user_context_data = false  # bool | optional+computed
  enable_token_revocation                       = false  # bool | optional+computed
  explicit_auth_flows                           = []     # set(string) | optional+computed
  id_token_validity                             = 0      # number | optional+computed
  logout_urls                                   = []     # set(string) | optional+computed
  name_pattern                                  = ""     # string | optional
  name_prefix                                   = ""     # string | optional
  prevent_user_existence_errors                 = ""     # string | optional+computed
  read_attributes                               = []     # set(string) | optional+computed
  refresh_token_validity                        = 0      # number | optional+computed
  supported_identity_providers                  = []     # set(string) | optional+computed
  write_attributes                              = []     # set(string) | optional+computed

  # client_secret                                 = ""     # string | computed+sensitive
  # id                                            = ""     # string | computed
  # name                                          = ""     # string | computed

  analytics_configuration { # list
    application_arn  = ""     # string | optional
    application_id   = ""     # string | optional
    external_id      = ""     # string | optional
    role_arn         = ""     # string | optional+computed
    user_data_shared = false  # bool | optional+computed

  }

  refresh_token_rotation { # list
    feature                    = ""     # string | required
    retry_grace_period_seconds = 0      # number | optional

  }

  token_validity_units { # list
    access_token  = ""     # string | optional+computed
    id_token      = ""     # string | optional+computed
    refresh_token = ""     # string | optional+computed

  }

}

