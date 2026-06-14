# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_autoscaling_group                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_autoscaling_group" "this" {

  name                                  = ""     # string | required
  id                                    = ""     # string | optional+computed

  # arn                                   = ""     # string | computed
  # availability_zones                    = []     # set(string) | computed
  # default_cooldown                      = 0      # number | computed
  # desired_capacity                      = 0      # number | computed
  # desired_capacity_type                 = ""     # string | computed
  # enabled_metrics                       = []     # set(string) | computed
  # health_check_grace_period             = 0      # number | computed
  # health_check_type                     = ""     # string | computed
  # instance_maintenance_policy = [  # list(object)
  #   {
  #     max_healthy_percentage = 0
  #     min_healthy_percentage = 0
  #   }
  # ]
  # launch_configuration                  = ""     # string | computed
  # launch_template = [  # list(object)
  #   {
  #     id = ""
  #     name = ""
  #     version = ""
  #   }
  # ]
  # load_balancers                        = []     # set(string) | computed
  # max_instance_lifetime                 = 0      # number | computed
  # max_size                              = 0      # number | computed
  # min_size                              = 0      # number | computed
  # mixed_instances_policy = [  # list(object)
  #   {
  #     instances_distribution = [  # list(object)
  #       {
  #         on_demand_allocation_strategy = ""
  #         on_demand_base_capacity = 0
  #         on_demand_percentage_above_base_capacity = 0
  #         spot_allocation_strategy = ""
  #         spot_instance_pools = 0
  #         spot_max_price = ""
  #       }
  #     ]
  #     launch_template = [  # list(object)
  #       {
  #         launch_template_specification = [  # list(object)
  #           {
  #             launch_template_id = ""
  #             launch_template_name = ""
  #             version = ""
  #           }
  #         ]
  #         override = [  # list(object)
  #           {
  #             instance_requirements = [  # list(object)
  #               {
  #                 accelerator_count = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 accelerator_manufacturers = []  # set(string)
  #                 accelerator_names = []  # set(string)
  #                 accelerator_total_memory_mib = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 accelerator_types = []  # set(string)
  #                 allowed_instance_types = []  # set(string)
  #                 bare_metal = ""
  #                 baseline_ebs_bandwidth_mbps = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 burstable_performance = ""
  #                 cpu_manufacturers = []  # set(string)
  #                 excluded_instance_types = []  # set(string)
  #                 instance_generations = []  # set(string)
  #                 local_storage = ""
  #                 local_storage_types = []  # set(string)
  #                 max_spot_price_as_percentage_of_optimal_on_demand_price = 0
  #                 memory_gib_per_vcpu = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 memory_mib = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 network_bandwidth_gbps = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 network_interface_count = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 on_demand_max_price_percentage_over_lowest_price = 0
  #                 require_hibernate_support = false
  #                 spot_max_price_percentage_over_lowest_price = 0
  #                 total_local_storage_gb = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #                 vcpu_count = [  # list(object)
  #                   {
  #                     max = 0
  #                     min = 0
  #                   }
  #                 ]
  #               }
  #             ]
  #             instance_type = ""
  #             launch_template_specification = [  # list(object)
  #               {
  #                 launch_template_id = ""
  #                 launch_template_name = ""
  #                 version = ""
  #               }
  #             ]
  #             weighted_capacity = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # new_instances_protected_from_scale_in = false  # bool | computed
  # placement_group                       = ""     # string | computed
  # predicted_capacity                    = 0      # number | computed
  # service_linked_role_arn               = ""     # string | computed
  # status                                = ""     # string | computed
  # suspended_processes                   = []     # set(string) | computed
  # tag = [  # set(object)
  #   {
  #     key = ""
  #     propagate_at_launch = false
  #     value = ""
  #   }
  # ]
  # target_group_arns                     = []     # set(string) | computed
  # termination_policies                  = []     # set(string) | computed
  # traffic_source = [  # set(object)
  #   {
  #     identifier = ""
  #     type = ""
  #   }
  # ]
  # vpc_zone_identifier                   = ""     # string | computed
  # warm_pool = [  # list(object)
  #   {
  #     instance_reuse_policy = [  # list(object)
  #       {
  #         reuse_on_scale_in = false
  #       }
  #     ]
  #     max_group_prepared_capacity = 0
  #     min_size = 0
  #     pool_state = ""
  #   }
  # ]
  # warm_pool_size                        = 0      # number | computed

}

