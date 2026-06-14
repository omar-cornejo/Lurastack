# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_service                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_service" "this" {

  service_name                   = ""     # string | required
  auto_scaling_configuration_arn = ""     # string | optional+computed
  id                             = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed
  # service_id                     = ""     # string | computed
  # service_url                    = ""     # string | computed
  # status                         = ""     # string | computed

  encryption_configuration { # list [0..1]
    kms_key = ""     # string | required

  }

  health_check_configuration { # list [0..1]
    healthy_threshold   = 0      # number | optional
    interval            = 0      # number | optional
    path                = ""     # string | optional
    protocol            = ""     # string | optional
    timeout             = 0      # number | optional
    unhealthy_threshold = 0      # number | optional

  }

  instance_configuration { # list [0..1]
    cpu               = ""     # string | optional
    instance_role_arn = ""     # string | optional
    memory            = ""     # string | optional

  }

  network_configuration { # list [0..1]
    ip_address_type = ""     # string | optional

    egress_configuration { # list [0..1]
      egress_type       = ""     # string | optional+computed
      vpc_connector_arn = ""     # string | optional

    }

    ingress_configuration { # list [0..1]
      is_publicly_accessible = false  # bool | optional

    }

  }

  observability_configuration { # list [0..1]
    observability_enabled           = false  # bool | required
    observability_configuration_arn = ""     # string | optional

  }

  source_configuration { # list [1..1]
    auto_deployments_enabled = false  # bool | optional

    authentication_configuration { # list [0..1]
      access_role_arn = ""     # string | optional
      connection_arn  = ""     # string | optional

    }

    code_repository { # list [0..1]
      repository_url   = ""     # string | required
      source_directory = ""     # string | optional+computed

      code_configuration { # list [0..1]
        configuration_source = ""     # string | required

        code_configuration_values { # list [0..1]
          runtime                       = ""     # string | required
          build_command                 = ""     # string | optional
          port                          = ""     # string | optional
          runtime_environment_secrets   = {}     # map(string) | optional
          runtime_environment_variables = {}     # map(string) | optional
          start_command                 = ""     # string | optional

        }

      }

      source_code_version { # list [1..1]
        type  = ""     # string | required
        value = ""     # string | required

      }

    }

    image_repository { # list [0..1]
      image_identifier      = ""     # string | required
      image_repository_type = ""     # string | required

      image_configuration { # list [0..1]
        port                          = ""     # string | optional
        runtime_environment_secrets   = {}     # map(string) | optional
        runtime_environment_variables = {}     # map(string) | optional
        start_command                 = ""     # string | optional

      }

    }

  }

}

