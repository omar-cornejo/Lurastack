# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codedeploy_deployment_group                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codedeploy_deployment_group" "this" {

  app_name                    = ""     # string | required
  deployment_group_name       = ""     # string | required
  service_role_arn            = ""     # string | required
  autoscaling_groups          = []     # set(string) | optional
  deployment_config_name      = ""     # string | optional
  id                          = ""     # string | optional+computed
  outdated_instances_strategy = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed
  termination_hook_enabled    = false  # bool | optional

  # arn                         = ""     # string | computed
  # compute_platform            = ""     # string | computed
  # deployment_group_id         = ""     # string | computed

  alarm_configuration { # list [0..1]
    alarms                    = []     # set(string) | optional
    enabled                   = false  # bool | optional
    ignore_poll_alarm_failure = false  # bool | optional

  }

  auto_rollback_configuration { # list [0..1]
    enabled = false  # bool | optional
    events  = []     # set(string) | optional

  }

  blue_green_deployment_config { # list [0..1]

    deployment_ready_option { # list [0..1]
      action_on_timeout    = ""     # string | optional
      wait_time_in_minutes = 0      # number | optional

    }

    green_fleet_provisioning_option { # list [0..1]
      action = ""     # string | optional

    }

    terminate_blue_instances_on_deployment_success { # list [0..1]
      action                           = ""     # string | optional
      termination_wait_time_in_minutes = 0      # number | optional

    }

  }

  deployment_style { # list [0..1]
    deployment_option = ""     # string | optional
    deployment_type   = ""     # string | optional

  }

  ec2_tag_filter { # set
    key   = ""     # string | optional
    type  = ""     # string | optional
    value = ""     # string | optional

  }

  ec2_tag_set { # set

    ec2_tag_filter { # set
      key   = ""     # string | optional
      type  = ""     # string | optional
      value = ""     # string | optional

    }

  }

  ecs_service { # list [0..1]
    cluster_name = ""     # string | required
    service_name = ""     # string | required

  }

  load_balancer_info { # list [0..1]

    elb_info { # set
      name = ""     # string | optional

    }

    target_group_info { # set
      name = ""     # string | optional

    }

    target_group_pair_info { # list [0..1]

      prod_traffic_route { # list [1..1]
        listener_arns = []     # set(string) | required

      }

      target_group { # list [1..2]
        name = ""     # string | required

      }

      test_traffic_route { # list [0..1]
        listener_arns = []     # set(string) | required

      }

    }

  }

  on_premises_instance_tag_filter { # set
    key   = ""     # string | optional
    type  = ""     # string | optional
    value = ""     # string | optional

  }

  trigger_configuration { # set
    trigger_events     = []     # set(string) | required
    trigger_name       = ""     # string | required
    trigger_target_arn = ""     # string | required

  }

}

