# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_fleet                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_fleet" "this" {

  context                             = ""     # string | optional
  excess_capacity_termination_policy  = ""     # string | optional
  fleet_state                         = ""     # string | optional+computed
  fulfilled_capacity                  = 0      # number | optional+computed
  fulfilled_on_demand_capacity        = 0      # number | optional+computed
  id                                  = ""     # string | optional+computed
  replace_unhealthy_instances         = false  # bool | optional
  tags                                = {}     # map(string) | optional
  tags_all                            = {}     # map(string) | optional+computed
  terminate_instances                 = false  # bool | optional
  terminate_instances_with_expiration = false  # bool | optional
  type                                = ""     # string | optional
  valid_from                          = ""     # string | optional
  valid_until                         = ""     # string | optional

  # arn                                 = ""     # string | computed

  fleet_instance_set { # list
    instance_ids  = []     # list(string) | optional+computed
    instance_type = ""     # string | optional+computed
    lifecycle     = ""     # string | optional+computed
    platform      = ""     # string | optional+computed

  }

  launch_template_config { # list [1..50]

    launch_template_specification { # list [0..1]
      version              = ""     # string | required
      launch_template_id   = ""     # string | optional
      launch_template_name = ""     # string | optional

    }

    override { # list [0..300]
      availability_zone = ""     # string | optional
      instance_type     = ""     # string | optional
      max_price         = ""     # string | optional
      priority          = 0      # number | optional
      subnet_id         = ""     # string | optional
      weighted_capacity = 0      # number | optional

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

        memory_mib { # list [1..1]
          min = 0      # number | required
          max = 0      # number | optional

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

        vcpu_count { # list [1..1]
          min = 0      # number | required
          max = 0      # number | optional

        }

      }

    }

  }

  on_demand_options { # list [0..1]
    allocation_strategy      = ""     # string | optional
    max_total_price          = ""     # string | optional
    min_target_capacity      = 0      # number | optional
    single_availability_zone = false  # bool | optional
    single_instance_type     = false  # bool | optional

    capacity_reservation_options { # list [0..1]
      usage_strategy = ""     # string | optional

    }

  }

  spot_options { # list [0..1]
    allocation_strategy            = ""     # string | optional
    instance_interruption_behavior = ""     # string | optional
    instance_pools_to_use_count    = 0      # number | optional
    max_total_price                = ""     # string | optional
    min_target_capacity            = 0      # number | optional
    single_availability_zone       = false  # bool | optional
    single_instance_type           = false  # bool | optional

    maintenance_strategies { # list [0..1]

      capacity_rebalance { # list [0..1]
        replacement_strategy = ""     # string | optional
        termination_delay    = 0      # number | optional

      }

    }

  }

  target_capacity_specification { # list [1..1]
    default_target_capacity_type = ""     # string | required
    total_target_capacity        = 0      # number | required
    on_demand_target_capacity    = 0      # number | optional
    spot_target_capacity         = 0      # number | optional
    target_capacity_unit_type    = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

