# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_group                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_group" "this" {

  max_size                         = 0      # number | required
  min_size                         = 0      # number | required
  availability_zones               = []     # set(string) | optional+computed
  capacity_rebalance               = false  # bool | optional
  context                          = ""     # string | optional
  default_cooldown                 = 0      # number | optional+computed
  default_instance_warmup          = 0      # number | optional
  desired_capacity                 = 0      # number | optional+computed
  desired_capacity_type            = ""     # string | optional
  enabled_metrics                  = []     # set(string) | optional
  force_delete                     = false  # bool | optional
  force_delete_warm_pool           = false  # bool | optional
  health_check_grace_period        = 0      # number | optional
  health_check_type                = ""     # string | optional+computed
  id                               = ""     # string | optional+computed
  ignore_failed_scaling_activities = false  # bool | optional
  launch_configuration             = ""     # string | optional
  load_balancers                   = []     # set(string) | optional+computed
  max_instance_lifetime            = 0      # number | optional
  metrics_granularity              = ""     # string | optional
  min_elb_capacity                 = 0      # number | optional
  name                             = ""     # string | optional+computed
  name_prefix                      = ""     # string | optional+computed
  placement_group                  = ""     # string | optional
  protect_from_scale_in            = false  # bool | optional
  service_linked_role_arn          = ""     # string | optional+computed
  suspended_processes              = []     # set(string) | optional
  target_group_arns                = []     # set(string) | optional+computed
  termination_policies             = []     # list(string) | optional
  vpc_zone_identifier              = []     # set(string) | optional+computed
  wait_for_capacity_timeout        = ""     # string | optional
  wait_for_elb_capacity            = 0      # number | optional

  # arn                              = ""     # string | computed
  # predicted_capacity               = 0      # number | computed
  # warm_pool_size                   = 0      # number | computed

  availability_zone_distribution { # list [0..1]
    capacity_distribution_strategy = ""     # string | optional

  }

  capacity_reservation_specification { # list [0..1]
    capacity_reservation_preference = ""     # string | optional+computed

    capacity_reservation_target { # list [0..1]
      capacity_reservation_ids                 = []     # list(string) | optional
      capacity_reservation_resource_group_arns = []     # list(string) | optional

    }

  }

  initial_lifecycle_hook { # set
    lifecycle_transition    = ""     # string | required
    name                    = ""     # string | required
    default_result          = ""     # string | optional+computed
    heartbeat_timeout       = 0      # number | optional
    notification_metadata   = ""     # string | optional
    notification_target_arn = ""     # string | optional
    role_arn                = ""     # string | optional

  }

  instance_maintenance_policy { # list [0..1]
    max_healthy_percentage = 0      # number | required
    min_healthy_percentage = 0      # number | required

  }

  instance_refresh { # list [0..1]
    strategy = ""     # string | required
    triggers = []     # set(string) | optional

    preferences { # list [0..1]
      auto_rollback                = false  # bool | optional
      checkpoint_delay             = ""     # string | optional
      checkpoint_percentages       = []     # list(number) | optional
      instance_warmup              = ""     # string | optional
      max_healthy_percentage       = 0      # number | optional
      min_healthy_percentage       = 0      # number | optional
      scale_in_protected_instances = ""     # string | optional
      skip_matching                = false  # bool | optional
      standby_instances            = ""     # string | optional

      alarm_specification { # list [0..1]
        alarms = []     # list(string) | optional

      }

    }

  }

  launch_template { # list [0..1]
    id      = ""     # string | optional+computed
    name    = ""     # string | optional+computed
    version = ""     # string | optional+computed

  }

  mixed_instances_policy { # list [0..1]

    instances_distribution { # list [0..1]
      on_demand_allocation_strategy            = ""     # string | optional+computed
      on_demand_base_capacity                  = 0      # number | optional+computed
      on_demand_percentage_above_base_capacity = 0      # number | optional+computed
      spot_allocation_strategy                 = ""     # string | optional+computed
      spot_instance_pools                      = 0      # number | optional+computed
      spot_max_price                           = ""     # string | optional

    }

    launch_template { # list [1..1]

      launch_template_specification { # list [1..1]
        launch_template_id   = ""     # string | optional+computed
        launch_template_name = ""     # string | optional+computed
        version              = ""     # string | optional+computed

      }

      override { # list
        instance_type     = ""     # string | optional
        weighted_capacity = ""     # string | optional

        instance_requirements { # list [0..1]
          accelerator_manufacturers                               = []     # set(string) | optional
          accelerator_names                                       = []     # set(string) | optional
          accelerator_types                                       = []     # set(string) | optional
          allowed_instance_types                                  = []     # set(string) | optional
          bare_metal                                              = ""     # string | optional
          burstable_performance                                   = ""     # string | optional
          cpu_manufacturers                                       = []     # set(string) | optional
          excluded_instance_types                                 = []     # set(string) | optional
          instance_generations                                    = []     # set(string) | optional
          local_storage                                           = ""     # string | optional
          local_storage_types                                     = []     # set(string) | optional
          max_spot_price_as_percentage_of_optimal_on_demand_price = 0      # number | optional
          on_demand_max_price_percentage_over_lowest_price        = 0      # number | optional
          require_hibernate_support                               = false  # bool | optional
          spot_max_price_percentage_over_lowest_price             = 0      # number | optional

          accelerator_count { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          accelerator_total_memory_mib { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          baseline_ebs_bandwidth_mbps { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          memory_gib_per_vcpu { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          memory_mib { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          network_bandwidth_gbps { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          network_interface_count { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          total_local_storage_gb { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

          vcpu_count { # list [0..1]
            max = 0      # number | optional
            min = 0      # number | optional

          }

        }

        launch_template_specification { # list [0..1]
          launch_template_id   = ""     # string | optional+computed
          launch_template_name = ""     # string | optional+computed
          version              = ""     # string | optional+computed

        }

      }

    }

  }

  tag { # set
    key                 = ""     # string | required
    propagate_at_launch = false  # bool | required
    value               = ""     # string | required

  }

  timeouts { # single
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  traffic_source { # set
    identifier = ""     # string | required
    type       = ""     # string | optional

  }

  warm_pool { # list [0..1]
    max_group_prepared_capacity = 0      # number | optional
    min_size                    = 0      # number | optional
    pool_state                  = ""     # string | optional

    instance_reuse_policy { # list [0..1]
      reuse_on_scale_in = false  # bool | optional

    }

  }

}

