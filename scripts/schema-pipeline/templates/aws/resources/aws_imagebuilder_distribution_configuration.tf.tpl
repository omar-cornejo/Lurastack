# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_distribution_configuration         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_distribution_configuration" "this" {

  name         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # date_created = ""     # string | computed
  # date_updated = ""     # string | computed

  distribution { # set [1..*]
    region                     = ""     # string | required
    license_configuration_arns = []     # set(string) | optional

    ami_distribution_configuration { # list [0..1]
      ami_tags           = {}     # map(string) | optional
      description        = ""     # string | optional
      kms_key_id         = ""     # string | optional
      name               = ""     # string | optional
      target_account_ids = []     # set(string) | optional

      launch_permission { # list [0..1]
        organization_arns        = []     # set(string) | optional
        organizational_unit_arns = []     # set(string) | optional
        user_groups              = []     # set(string) | optional
        user_ids                 = []     # set(string) | optional

      }

    }

    container_distribution_configuration { # list [0..1]
      container_tags = []     # set(string) | optional
      description    = ""     # string | optional

      target_repository { # list [1..1]
        repository_name = ""     # string | required
        service         = ""     # string | required

      }

    }

    fast_launch_configuration { # set [0..1000]
      account_id            = ""     # string | required
      enabled               = false  # bool | required
      max_parallel_launches = 0      # number | optional

      launch_template { # list [0..1]
        launch_template_id      = ""     # string | optional
        launch_template_name    = ""     # string | optional
        launch_template_version = ""     # string | optional

      }

      snapshot_configuration { # list [0..1]
        target_resource_count = 0      # number | optional

      }

    }

    launch_template_configuration { # set [0..100]
      launch_template_id = ""     # string | required
      account_id         = ""     # string | optional
      default            = false  # bool | optional

    }

    s3_export_configuration { # list [0..1]
      disk_image_format = ""     # string | required
      role_name         = ""     # string | required
      s3_bucket         = ""     # string | required
      s3_prefix         = ""     # string | optional

    }

    ssm_parameter_configuration { # set
      parameter_name = ""     # string | required
      ami_account_id = ""     # string | optional
      data_type      = ""     # string | optional

    }

  }

}

