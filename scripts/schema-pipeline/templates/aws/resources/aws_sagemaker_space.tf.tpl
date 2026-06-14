# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_space                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_space" "this" {

  domain_id                = ""     # string | required
  space_name               = ""     # string | required
  id                       = ""     # string | optional+computed
  space_display_name       = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # home_efs_file_system_uid = ""     # string | computed
  # url                      = ""     # string | computed

  ownership_settings { # list [0..1]
    owner_user_profile_name = ""     # string | required

  }

  space_settings { # list [0..1]
    app_type = ""     # string | optional

    code_editor_app_settings { # list [0..1]

      app_lifecycle_management { # list [0..1]

        idle_settings { # list [0..1]
          idle_timeout_in_minutes = 0      # number | optional

        }

      }

      default_resource_spec { # list [1..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    custom_file_system { # list

      efs_file_system { # list [1..1]
        file_system_id = ""     # string | required

      }

    }

    jupyter_lab_app_settings { # list [0..1]

      app_lifecycle_management { # list [0..1]

        idle_settings { # list [0..1]
          idle_timeout_in_minutes = 0      # number | optional

        }

      }

      code_repository { # set [0..10]
        repository_url = ""     # string | required

      }

      default_resource_spec { # list [1..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    jupyter_server_app_settings { # list [0..1]
      lifecycle_config_arns = []     # set(string) | optional

      code_repository { # set [0..10]
        repository_url = ""     # string | required

      }

      default_resource_spec { # list [1..1]
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

      default_resource_spec { # list [1..1]
        instance_type                 = ""     # string | optional
        lifecycle_config_arn          = ""     # string | optional
        sagemaker_image_arn           = ""     # string | optional
        sagemaker_image_version_alias = ""     # string | optional
        sagemaker_image_version_arn   = ""     # string | optional

      }

    }

    space_storage_settings { # list [0..1]

      ebs_storage_settings { # list [1..1]
        ebs_volume_size_in_gb = 0      # number | required

      }

    }

  }

  space_sharing_settings { # list [0..1]
    sharing_type = ""     # string | required

  }

}

