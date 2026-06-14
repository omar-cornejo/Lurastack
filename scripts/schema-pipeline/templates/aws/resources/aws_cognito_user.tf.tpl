# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_user                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_user" "this" {

  user_pool_id             = ""     # string | required
  username                 = ""     # string | required
  attributes               = {}     # map(string) | optional
  client_metadata          = {}     # map(string) | optional
  desired_delivery_mediums = []     # set(string) | optional
  enabled                  = false  # bool | optional
  force_alias_creation     = false  # bool | optional
  id                       = ""     # string | optional+computed
  message_action           = ""     # string | optional
  password                 = ""     # string | optional+sensitive
  temporary_password       = ""     # string | optional+sensitive
  validation_data          = {}     # map(string) | optional

  # creation_date            = ""     # string | computed
  # last_modified_date       = ""     # string | computed
  # mfa_setting_list         = []     # set(string) | computed
  # preferred_mfa_setting    = ""     # string | computed
  # status                   = ""     # string | computed
  # sub                      = ""     # string | computed

}

