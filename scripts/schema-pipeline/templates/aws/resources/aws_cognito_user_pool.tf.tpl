# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_user_pool                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_user_pool" "this" {

  name                       = ""     # string | required
  alias_attributes           = []     # set(string) | optional
  auto_verified_attributes   = []     # set(string) | optional
  deletion_protection        = ""     # string | optional
  email_verification_message = ""     # string | optional+computed
  email_verification_subject = ""     # string | optional+computed
  id                         = ""     # string | optional+computed
  mfa_configuration          = ""     # string | optional
  sms_authentication_message = ""     # string | optional
  sms_verification_message   = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed
  user_pool_tier             = ""     # string | optional+computed
  username_attributes        = []     # set(string) | optional

  # arn                        = ""     # string | computed
  # creation_date              = ""     # string | computed
  # custom_domain              = ""     # string | computed
  # domain                     = ""     # string | computed
  # endpoint                   = ""     # string | computed
  # estimated_number_of_users  = 0      # number | computed
  # last_modified_date         = ""     # string | computed

  account_recovery_setting { # list [0..1]

    recovery_mechanism { # set [0..2]
      name     = ""     # string | required
      priority = 0      # number | required

    }

  }

  admin_create_user_config { # list [0..1]
    allow_admin_create_user_only = false  # bool | optional

    invite_message_template { # list [0..1]
      email_message = ""     # string | optional
      email_subject = ""     # string | optional
      sms_message   = ""     # string | optional

    }

  }

  device_configuration { # list [0..1]
    challenge_required_on_new_device      = false  # bool | optional
    device_only_remembered_on_user_prompt = false  # bool | optional

  }

  email_configuration { # list [0..1]
    configuration_set      = ""     # string | optional
    email_sending_account  = ""     # string | optional
    from_email_address     = ""     # string | optional
    reply_to_email_address = ""     # string | optional
    source_arn             = ""     # string | optional

  }

  email_mfa_configuration { # list [0..1]
    message = ""     # string | optional
    subject = ""     # string | optional

  }

  lambda_config { # list [0..1]
    create_auth_challenge          = ""     # string | optional
    custom_message                 = ""     # string | optional
    define_auth_challenge          = ""     # string | optional
    kms_key_id                     = ""     # string | optional
    post_authentication            = ""     # string | optional
    post_confirmation              = ""     # string | optional
    pre_authentication             = ""     # string | optional
    pre_sign_up                    = ""     # string | optional
    pre_token_generation           = ""     # string | optional+computed
    user_migration                 = ""     # string | optional
    verify_auth_challenge_response = ""     # string | optional

    custom_email_sender { # list [0..1]
      lambda_arn     = ""     # string | required
      lambda_version = ""     # string | required

    }

    custom_sms_sender { # list [0..1]
      lambda_arn     = ""     # string | required
      lambda_version = ""     # string | required

    }

    pre_token_generation_config { # list [0..1]
      lambda_arn     = ""     # string | required
      lambda_version = ""     # string | required

    }

  }

  password_policy { # list [0..1]
    minimum_length                   = 0      # number | optional
    password_history_size            = 0      # number | optional
    require_lowercase                = false  # bool | optional
    require_numbers                  = false  # bool | optional
    require_symbols                  = false  # bool | optional
    require_uppercase                = false  # bool | optional
    temporary_password_validity_days = 0      # number | optional+computed

  }

  schema { # set [0..50]
    attribute_data_type      = ""     # string | required
    name                     = ""     # string | required
    developer_only_attribute = false  # bool | optional
    mutable                  = false  # bool | optional
    required                 = false  # bool | optional

    number_attribute_constraints { # list [0..1]
      max_value = ""     # string | optional
      min_value = ""     # string | optional

    }

    string_attribute_constraints { # list [0..1]
      max_length = ""     # string | optional
      min_length = ""     # string | optional

    }

  }

  sign_in_policy { # list [0..1]
    allowed_first_auth_factors = []     # set(string) | optional

  }

  sms_configuration { # list [0..1]
    external_id    = ""     # string | required
    sns_caller_arn = ""     # string | required
    sns_region     = ""     # string | optional+computed

  }

  software_token_mfa_configuration { # list [0..1]
    enabled = false  # bool | required

  }

  user_attribute_update_settings { # list [0..1]
    attributes_require_verification_before_update = []     # set(string) | required

  }

  user_pool_add_ons { # list [0..1]
    advanced_security_mode = ""     # string | required

    advanced_security_additional_flows { # list [0..1]
      custom_auth_mode = ""     # string | optional+computed

    }

  }

  username_configuration { # list [0..1]
    case_sensitive = false  # bool | optional+computed

  }

  verification_message_template { # list [0..1]
    default_email_option  = ""     # string | optional
    email_message         = ""     # string | optional+computed
    email_message_by_link = ""     # string | optional+computed
    email_subject         = ""     # string | optional+computed
    email_subject_by_link = ""     # string | optional+computed
    sms_message           = ""     # string | optional+computed

  }

  web_authn_configuration { # list [0..1]
    relying_party_id  = ""     # string | optional
    user_verification = ""     # string | optional

  }

}

