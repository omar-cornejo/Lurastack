# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_pool_client                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_pool_client" "this" {

  client_id                                     = ""     # string | required
  user_pool_id                                  = ""     # string | required
  id                                            = ""     # string | optional+computed

  # access_token_validity                         = 0      # number | computed
  # allowed_oauth_flows                           = []     # set(string) | computed
  # allowed_oauth_flows_user_pool_client          = false  # bool | computed
  # allowed_oauth_scopes                          = []     # set(string) | computed
  # analytics_configuration = [  # list(object)
  #   {
  #     application_arn = ""
  #     application_id = ""
  #     external_id = ""
  #     role_arn = ""
  #     user_data_shared = false
  #   }
  # ]
  # callback_urls                                 = []     # set(string) | computed
  # client_secret                                 = ""     # string | computed+sensitive
  # default_redirect_uri                          = ""     # string | computed
  # enable_propagate_additional_user_context_data = false  # bool | computed
  # enable_token_revocation                       = false  # bool | computed
  # explicit_auth_flows                           = []     # set(string) | computed
  # generate_secret                               = false  # bool | computed
  # id_token_validity                             = 0      # number | computed
  # logout_urls                                   = []     # set(string) | computed
  # name                                          = ""     # string | computed
  # prevent_user_existence_errors                 = ""     # string | computed
  # read_attributes                               = []     # set(string) | computed
  # refresh_token_rotation = [  # list(object)
  #   {
  #     feature = ""
  #     retry_grace_period_seconds = 0
  #   }
  # ]
  # refresh_token_validity                        = 0      # number | computed
  # supported_identity_providers                  = []     # set(string) | computed
  # token_validity_units = [  # list(object)
  #   {
  #     access_token = ""
  #     id_token = ""
  #     refresh_token = ""
  #   }
  # ]
  # write_attributes                              = []     # set(string) | computed

}

