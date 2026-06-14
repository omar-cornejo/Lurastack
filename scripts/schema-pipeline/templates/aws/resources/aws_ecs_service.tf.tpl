# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_service                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_service" "this" {

  name                               = ""     # string | required
  availability_zone_rebalancing      = ""     # string | optional
  cluster                            = ""     # string | optional+computed
  deployment_maximum_percent         = 0      # number | optional
  deployment_minimum_healthy_percent = 0      # number | optional
  desired_count                      = 0      # number | optional
  enable_ecs_managed_tags            = false  # bool | optional
  enable_execute_command             = false  # bool | optional
  force_delete                       = false  # bool | optional
  force_new_deployment               = false  # bool | optional
  health_check_grace_period_seconds  = 0      # number | optional
  iam_role                           = ""     # string | optional+computed
  id                                 = ""     # string | optional+computed
  launch_type                        = ""     # string | optional+computed
  platform_version                   = ""     # string | optional+computed
  propagate_tags                     = ""     # string | optional
  scheduling_strategy                = ""     # string | optional
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  task_definition                    = ""     # string | optional
  triggers                           = {}     # map(string) | optional+computed
  wait_for_steady_state              = false  # bool | optional

  alarms { # list [0..1]
    alarm_names = []     # set(string) | required
    enable      = false  # bool | required
    rollback    = false  # bool | required

  }

  capacity_provider_strategy { # set
    capacity_provider = ""     # string | required
    base              = 0      # number | optional
    weight            = 0      # number | optional

  }

  deployment_circuit_breaker { # list [0..1]
    enable   = false  # bool | required
    rollback = false  # bool | required

  }

  deployment_controller { # list [0..1]
    type = ""     # string | optional

  }

  load_balancer { # set
    container_name   = ""     # string | required
    container_port   = 0      # number | required
    elb_name         = ""     # string | optional
    target_group_arn = ""     # string | optional

  }

  network_configuration { # list [0..1]
    subnets          = []     # set(string) | required
    assign_public_ip = false  # bool | optional
    security_groups  = []     # set(string) | optional

  }

  ordered_placement_strategy { # list [0..5]
    type  = ""     # string | required
    field = ""     # string | optional

  }

  placement_constraints { # set [0..10]
    type       = ""     # string | required
    expression = ""     # string | optional

  }

  service_connect_configuration { # list [0..1]
    enabled   = false  # bool | required
    namespace = ""     # string | optional+computed

    log_configuration { # list [0..1]
      log_driver = ""     # string | required
      options    = {}     # map(string) | optional+computed

      secret_option { # list
        name       = ""     # string | required
        value_from = ""     # string | required

      }

    }

    service { # list
      port_name             = ""     # string | required
      discovery_name        = ""     # string | optional+computed
      ingress_port_override = 0      # number | optional

      client_alias { # list [0..1]
        port     = 0      # number | required
        dns_name = ""     # string | optional+computed

      }

      timeout { # list [0..1]
        idle_timeout_seconds        = 0      # number | optional
        per_request_timeout_seconds = 0      # number | optional

      }

      tls { # list [0..1]
        kms_key  = ""     # string | optional
        role_arn = ""     # string | optional

        issuer_cert_authority { # list [1..1]
          aws_pca_authority_arn = ""     # string | required

        }

      }

    }

  }

  service_registries { # list [0..1]
    registry_arn   = ""     # string | required
    container_name = ""     # string | optional
    container_port = 0      # number | optional
    port           = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  volume_configuration { # list [0..1]
    name = ""     # string | required

    managed_ebs_volume { # list [1..1]
      role_arn                   = ""     # string | required
      encrypted                  = false  # bool | optional
      file_system_type           = ""     # string | optional
      iops                       = 0      # number | optional
      kms_key_id                 = ""     # string | optional
      size_in_gb                 = 0      # number | optional
      snapshot_id                = ""     # string | optional
      throughput                 = 0      # number | optional
      volume_initialization_rate = 0      # number | optional
      volume_type                = ""     # string | optional

      tag_specifications { # list
        resource_type  = ""     # string | required
        propagate_tags = ""     # string | optional
        tags           = {}     # map(string) | optional

      }

    }

  }

  vpc_lattice_configurations { # set
    port_name        = ""     # string | required
    role_arn         = ""     # string | required
    target_group_arn = ""     # string | required

  }

}

