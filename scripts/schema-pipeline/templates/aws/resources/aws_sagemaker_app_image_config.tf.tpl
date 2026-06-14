# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_app_image_config                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_app_image_config" "this" {

  app_image_config_name = ""     # string | required
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed

  code_editor_app_image_config { # list [0..1]

    container_config { # list [0..1]
      container_arguments             = []     # list(string) | optional
      container_entrypoint            = []     # list(string) | optional
      container_environment_variables = {}     # map(string) | optional

    }

    file_system_config { # list [0..1]
      default_gid = 0      # number | optional
      default_uid = 0      # number | optional
      mount_path  = ""     # string | optional

    }

  }

  jupyter_lab_image_config { # list [0..1]

    container_config { # list [0..1]
      container_arguments             = []     # list(string) | optional
      container_entrypoint            = []     # list(string) | optional
      container_environment_variables = {}     # map(string) | optional

    }

    file_system_config { # list [0..1]
      default_gid = 0      # number | optional
      default_uid = 0      # number | optional
      mount_path  = ""     # string | optional

    }

  }

  kernel_gateway_image_config { # list [0..1]

    file_system_config { # list [0..1]
      default_gid = 0      # number | optional
      default_uid = 0      # number | optional
      mount_path  = ""     # string | optional

    }

    kernel_spec { # list [1..5]
      name         = ""     # string | required
      display_name = ""     # string | optional

    }

  }

}

