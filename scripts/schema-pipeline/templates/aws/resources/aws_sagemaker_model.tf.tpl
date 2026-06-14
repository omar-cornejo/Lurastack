# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_model                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_model" "this" {

  execution_role_arn       = ""     # string | required
  enable_network_isolation = false  # bool | optional
  id                       = ""     # string | optional+computed
  name                     = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed

  container { # list
    container_hostname           = ""     # string | optional
    environment                  = {}     # map(string) | optional
    image                        = ""     # string | optional
    inference_specification_name = ""     # string | optional
    mode                         = ""     # string | optional
    model_data_url               = ""     # string | optional
    model_package_name           = ""     # string | optional

    image_config { # list [0..1]
      repository_access_mode = ""     # string | required

      repository_auth_config { # list [0..1]
        repository_credentials_provider_arn = ""     # string | required

      }

    }

    model_data_source { # list [0..1]

      s3_data_source { # list [1..*]
        compression_type = ""     # string | required
        s3_data_type     = ""     # string | required
        s3_uri           = ""     # string | required

        model_access_config { # list [0..1]
          accept_eula = false  # bool | required

        }

      }

    }

    multi_model_config { # list [0..1]
      model_cache_setting = ""     # string | optional

    }

  }

  inference_execution_config { # list [0..1]
    mode = ""     # string | required

  }

  primary_container { # list [0..1]
    container_hostname           = ""     # string | optional
    environment                  = {}     # map(string) | optional
    image                        = ""     # string | optional
    inference_specification_name = ""     # string | optional
    mode                         = ""     # string | optional
    model_data_url               = ""     # string | optional
    model_package_name           = ""     # string | optional

    image_config { # list [0..1]
      repository_access_mode = ""     # string | required

      repository_auth_config { # list [0..1]
        repository_credentials_provider_arn = ""     # string | required

      }

    }

    model_data_source { # list [0..1]

      s3_data_source { # list [1..*]
        compression_type = ""     # string | required
        s3_data_type     = ""     # string | required
        s3_uri           = ""     # string | required

        model_access_config { # list [0..1]
          accept_eula = false  # bool | required

        }

      }

    }

    multi_model_config { # list [0..1]
      model_cache_setting = ""     # string | optional

    }

  }

  vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnets            = []     # set(string) | required

  }

}

