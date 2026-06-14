# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_pool                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_pool" "this" {

  user_pool_id               = ""     # string | required

  # account_recovery_setting = [  # list(object)
  #   {
  #     recovery_mechanism = [  # list(object)
  #       {
  #         name = ""
  #         priority = 0
  #       }
  #     ]
  #   }
  # ]
  # admin_create_user_config = [  # list(object)
  #   {
  #     allow_admin_create_user_only = false
  #     invite_message_template = [  # list(object)
  #       {
  #         email_message = ""
  #         email_subject = ""
  #         sms_message = ""
  #       }
  #     ]
  #     unused_account_validity_days = 0
  #   }
  # ]
  # arn                        = ""     # string | computed
  # auto_verified_attributes   = []     # list(string) | computed
  # creation_date              = ""     # string | computed
  # custom_domain              = ""     # string | computed
  # deletion_protection        = ""     # string | computed
  # device_configuration = [  # list(object)
  #   {
  #     challenge_required_on_new_device = false
  #     device_only_remembered_on_user_prompt = false
  #   }
  # ]
  # domain                     = ""     # string | computed
  # email_configuration = [  # list(object)
  #   {
  #     configuration_set = ""
  #     email_sending_account = ""
  #     from = ""
  #     reply_to_email_address = ""
  #     source_arn = ""
  #   }
  # ]
  # estimated_number_of_users  = 0      # number | computed
  # id                         = ""     # string | computed
  # lambda_config = [  # list(object)
  #   {
  #     create_auth_challenge = ""
  #     custom_email_sender = [  # list(object)
  #       {
  #         lambda_arn = ""
  #         lambda_version = ""
  #       }
  #     ]
  #     custom_message = ""
  #     custom_sms_sender = [  # list(object)
  #       {
  #         lambda_arn = ""
  #         lambda_version = ""
  #       }
  #     ]
  #     define_auth_challenge = ""
  #     kms_key_id = ""
  #     post_authentication = ""
  #     post_confirmation = ""
  #     pre_authentication = ""
  #     pre_sign_up = ""
  #     pre_token_generation = ""
  #     pre_token_generation_config = [  # list(object)
  #       {
  #         lambda_arn = ""
  #         lambda_version = ""
  #       }
  #     ]
  #     user_migration = ""
  #     verify_auth_challenge_response = ""
  #   }
  # ]
  # last_modified_date         = ""     # string | computed
  # mfa_configuration          = ""     # string | computed
  # name                       = ""     # string | computed
  # schema_attributes = [  # list(object)
  #   {
  #     attribute_data_type = ""
  #     developer_only_attribute = false
  #     mutable = false
  #     name = ""
  #     number_attribute_constraints = [  # list(object)
  #       {
  #         max_value = ""
  #         min_value = ""
  #       }
  #     ]
  #     required = false
  #     string_attribute_constraints = [  # list(object)
  #       {
  #         max_length = ""
  #         min_length = ""
  #       }
  #     ]
  #   }
  # ]
  # sms_authentication_message = ""     # string | computed
  # sms_configuration_failure  = ""     # string | computed
  # sms_verification_message   = ""     # string | computed
  # tags                       = {}     # map(string) | computed
  # user_pool_add_ons = [  # list(object)
  #   {
  #     advanced_security_additional_flows = [  # list(object)
  #       {
  #         custom_auth_mode = ""
  #       }
  #     ]
  #     advanced_security_mode = ""
  #   }
  # ]
  # user_pool_tags             = {}     # map(string) | computed+DEPRECATED
  # username_attributes        = []     # list(string) | computed

}

