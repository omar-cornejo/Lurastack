# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_spot_fleet_request                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_spot_fleet_request" "this" {

  iam_fleet_role                      = ""     # string | required
  target_capacity                     = 0      # number | required
  allocation_strategy                 = ""     # string | optional
  context                             = ""     # string | optional
  excess_capacity_termination_policy  = ""     # string | optional
  fleet_type                          = ""     # string | optional
  id                                  = ""     # string | optional+computed
  instance_interruption_behaviour     = ""     # string | optional
  instance_pools_to_use_count         = 0      # number | optional
  load_balancers                      = []     # set(string) | optional+computed
  on_demand_allocation_strategy       = ""     # string | optional
  on_demand_max_total_price           = ""     # string | optional
  on_demand_target_capacity           = 0      # number | optional
  replace_unhealthy_instances         = false  # bool | optional
  spot_price                          = ""     # string | optional
  tags                                = {}     # map(string) | optional
  tags_all                            = {}     # map(string) | optional+computed
  target_capacity_unit_type           = ""     # string | optional
  target_group_arns                   = []     # set(string) | optional+computed
  terminate_instances_on_delete       = ""     # string | optional
  terminate_instances_with_expiration = false  # bool | optional
  valid_from                          = ""     # string | optional
  valid_until                         = ""     # string | optional
  wait_for_fulfillment                = false  # bool | optional

  # client_token                        = ""     # string | computed
  # spot_request_state                  = ""     # string | computed

  launch_specification { # set
    ami                         = ""     # string | required
    instance_type               = ""     # string | required
    associate_public_ip_address = false  # bool | optional
    availability_zone           = ""     # string | optional+computed
    ebs_optimized               = false  # bool | optional
    iam_instance_profile        = ""     # string | optional
    iam_instance_profile_arn    = ""     # string | optional
    key_name                    = ""     # string | optional+computed
    monitoring                  = false  # bool | optional
    placement_group             = ""     # string | optional+computed
    placement_tenancy           = ""     # string | optional
    spot_price                  = ""     # string | optional
    subnet_id                   = ""     # string | optional+computed
    tags                        = {}     # map(string) | optional
    user_data                   = ""     # string | optional
    vpc_security_group_ids      = []     # set(string) | optional+computed
    weighted_capacity           = ""     # string | optional

    ebs_block_device { # set
      device_name           = ""     # string | required
      delete_on_termination = false  # bool | optional
      encrypted             = false  # bool | optional+computed
      iops                  = 0      # number | optional+computed
      kms_key_id            = ""     # string | optional+computed
      snapshot_id           = ""     # string | optional+computed
      throughput            = 0      # number | optional+computed
      volume_size           = 0      # number | optional+computed
      volume_type           = ""     # string | optional+computed

    }

    ephemeral_block_device { # set
      device_name  = ""     # string | required
      virtual_name = ""     # string | required

    }

    root_block_device { # set
      delete_on_termination = false  # bool | optional
      encrypted             = false  # bool | optional+computed
      iops                  = 0      # number | optional+computed
      kms_key_id            = ""     # string | optional+computed
      throughput            = 0      # number | optional+computed
      volume_size           = 0      # number | optional+computed
      volume_type           = ""     # string | optional+computed

    }

  }

  launch_template_config { # set

    launch_template_specification { # list [1..1]
      id      = ""     # string | optional
      name    = ""     # string | optional
      version = ""     # string | optional

    }

    overrides { # set
      availability_zone = ""     # string | optional
      instance_type     = ""     # string | optional
      priority          = 0      # number | optional+computed
      spot_price        = ""     # string | optional+computed
      subnet_id         = ""     # string | optional+computed
      weighted_capacity = 0      # number | optional+computed

      instance_requirements { # list [0..1]
        accelerator_manufacturers                        = []     # set(string) | optional
        accelerator_names                                = []     # set(string) | optional
        accelerator_types                                = []     # set(string) | optional
        allowed_instance_types                           = []     # set(string) | optional
        bare_metal                                       = ""     # string | optional
        burstable_performance                            = ""     # string | optional
        cpu_manufacturers                                = []     # set(string) | optional
        excluded_instance_types                          = []     # set(string) | optional
        instance_generations                             = []     # set(string) | optional
        local_storage                                    = ""     # string | optional
        local_storage_types                              = []     # set(string) | optional
        on_demand_max_price_percentage_over_lowest_price = 0      # number | optional
        require_hibernate_support                        = false  # bool | optional
        spot_max_price_percentage_over_lowest_price      = 0      # number | optional

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

    }

  }

  spot_maintenance_strategies { # list [0..1]

    capacity_rebalance { # list [0..1]
      replacement_strategy = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

