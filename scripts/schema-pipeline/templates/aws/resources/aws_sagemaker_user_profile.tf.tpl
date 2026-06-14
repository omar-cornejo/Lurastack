# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_user_profile                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_user_profile" "this" {

  domain_id                      = ""     # string | required
  user_profile_name              = ""     # string | required
  id                             = ""     # string | optional+computed
  single_sign_on_user_identifier = ""     # string | optional
  single_sign_on_user_value      = ""     # string | optional
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed
  # home_efs_file_system_uid       = ""     # string | computed

  user_settings { # list [0..1]
    execution_role      = ""     # string | required
    auto_mount_home_efs = ""     # string | optional+computed
    default_landing_uri = ""     # string | optional
    security_groups     = []     # set(string) | optional
    studio_web_portal   = ""     # string | optional+computed

    canvas_app_settings { # list [0..1]

      direct_deploy_settings { # list [0..1]
        status = ""     # string | optional

      }

      emr_serverless_settings { # list [0..1]
        execution_role_arn = ""     # string | optional
        status             = ""     # string | optional

      }

      generative_ai_settings { # list [0..1]
        amazon_bedrock_role_arn = ""     # string | optional

      }

      identity_provider_oauth_settings { # list [0..20]
        secret_arn       = ""     # string | required
        data_source_name = ""     # string | optional
        status           = ""     # string | optional

      }

      kendra_settings { # list [0..1]
        status = ""     # string | optional

      }

      model_register_settings { # list [0..1]
        cross_account_model_register_role_arn = ""     # string | optional
        status                                = ""     # string | optional

      }

      time_series_forecasting_settings { # list [0..1]
        amazon_forecast_role_arn = ""     # string | optional
        status                   = ""     # string | optional

      }

      workspace_settings { # list [0..1]
        s3_artifact_path = ""     # string | optional
        s3_kms_key_id    = ""     # string | optional

      }

    }

    code_editor_app_settings { # list [0..1]
      built_in_lifecycle_config_arn = ""     # string | optional
      lifecycle_config_arns         = []     # set(string) | optional

      app_lifecycle_management { # list [0..1]

        idle_settings { # list [0..1]
          idle_timeout_in_minutes     = 0      # number | optional
          lifecycle_management        = ""     # string | optional
          max_idle_timeout_in_minutes = 0      # number | optional
          min_idle_timeout_in_minutes = 0      # number | optional

        }

      }

      custom_image { # list [0..200]
        app_image_config_name = ""     # string | required
        image_name            = ""     # string | required
        image_version_number  = 0      # number | optional

      }

      default_resource_spec { # list [0..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    custom_file_system_config { # list

      efs_file_system_config { # list
        file_system_id   = ""     # string | required
        file_system_path = ""     # string | optional

      }

    }

    custom_posix_user_config { # list [0..1]
      gid = 0      # number | required
      uid = 0      # number | required

    }

    jupyter_lab_app_settings { # list [0..1]
      built_in_lifecycle_config_arn = ""     # string | optional
      lifecycle_config_arns         = []     # set(string) | optional

      app_lifecycle_management { # list [0..1]

        idle_settings { # list [0..1]
          idle_timeout_in_minutes     = 0      # number | optional
          lifecycle_management        = ""     # string | optional
          max_idle_timeout_in_minutes = 0      # number | optional
          min_idle_timeout_in_minutes = 0      # number | optional

        }

      }

      code_repository { # set [0..10]
        repository_url = ""     # string | required

      }

      custom_image { # list [0..200]
        app_image_config_name = ""     # string | required
        image_name            = ""     # string | required
        image_version_number  = 0      # number | optional

      }

      default_resource_spec { # list [0..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

      emr_settings { # list [0..1]
        assumable_role_arns = []     # set(string) | optional
        execution_role_arns = []     # set(string) | optional

      }

    }

    jupyter_server_app_settings { # list [0..1]
      lifecycle_config_arns = []     # set(string) | optional

      code_repository { # set [0..10]
        repository_url = ""     # string | required

      }

      default_resource_spec { # list [0..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    kernel_gateway_app_settings { # list [0..1]
      lifecycle_config_arns = []     # set(string) | optional

      custom_image { # list [0..200]
        app_image_config_name = ""     # string | required
        image_name            = ""     # string | required
        image_version_number  = 0      # number | optional

      }

      default_resource_spec { # list [0..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    r_session_app_settings { # list [0..1]

      custom_image { # list [0..200]
        app_image_config_name = ""     # string | required
        image_name            = ""     # string | required
        image_version_number  = 0      # number | optional

      }

      default_resource_spec { # list [0..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    r_studio_server_pro_app_settings { # list [0..1]
      access_status = ""     # string | optional
      user_group    = ""     # string | optional

    }

    sharing_settings { # list [0..1]
      notebook_output_option = ""     # string | optional
      s3_kms_key_id          = ""     # string | optional
      s3_output_path         = ""     # string | optional

    }

    space_storage_settings { # list [0..1]

      default_ebs_storage_settings { # list [0..1]
        default_ebs_volume_size_in_gb = 0      # number | required
        maximum_ebs_volume_size_in_gb = 0      # number | required

      }

    }

    studio_web_portal_settings { # list [0..1]
      hidden_app_types      = []     # set(string) | optional
      hidden_instance_types = []     # set(string) | optional
      hidden_ml_tools       = []     # set(string) | optional

    }

    tensor_board_app_settings { # list [0..1]

      default_resource_spec { # list [0..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

  }

}

