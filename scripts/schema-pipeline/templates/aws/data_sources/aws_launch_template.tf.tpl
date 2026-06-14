# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_launch_template                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_launch_template" "this" {

  id                                   = ""     # string | optional+computed
  name                                 = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # block_device_mappings = [  # list(object)
  #   {
  #     device_name = ""
  #     ebs = [  # list(object)
  #       {
  #         delete_on_termination = ""
  #         encrypted = ""
  #         iops = 0
  #         kms_key_id = ""
  #         snapshot_id = ""
  #         throughput = 0
  #         volume_initialization_rate = 0
  #         volume_size = 0
  #         volume_type = ""
  #       }
  #     ]
  #     no_device = ""
  #     virtual_name = ""
  #   }
  # ]
  # capacity_reservation_specification = [  # list(object)
  #   {
  #     capacity_reservation_preference = ""
  #     capacity_reservation_target = [  # list(object)
  #       {
  #         capacity_reservation_id = ""
  #         capacity_reservation_resource_group_arn = ""
  #       }
  #     ]
  #   }
  # ]
  # cpu_options = [  # list(object)
  #   {
  #     amd_sev_snp = ""
  #     core_count = 0
  #     threads_per_core = 0
  #   }
  # ]
  # credit_specification = [  # list(object)
  #   {
  #     cpu_credits = ""
  #   }
  # ]
  # default_version                      = 0      # number | computed
  # description                          = ""     # string | computed
  # disable_api_stop                     = false  # bool | computed
  # disable_api_termination              = false  # bool | computed
  # ebs_optimized                        = ""     # string | computed
  # elastic_gpu_specifications = [  # list(object)
  #   {
  #     type = ""
  #   }
  # ]
  # elastic_inference_accelerator = [  # list(object)
  #   {
  #     type = ""
  #   }
  # ]
  # enclave_options = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # hibernation_options = [  # list(object)
  #   {
  #     configured = false
  #   }
  # ]
  # iam_instance_profile = [  # list(object)
  #   {
  #     arn = ""
  #     name = ""
  #   }
  # ]
  # image_id                             = ""     # string | computed
  # instance_initiated_shutdown_behavior = ""     # string | computed
  # instance_market_options = [  # list(object)
  #   {
  #     market_type = ""
  #     spot_options = [  # list(object)
  #       {
  #         block_duration_minutes = 0
  #         instance_interruption_behavior = ""
  #         max_price = ""
  #         spot_instance_type = ""
  #         valid_until = ""
  #       }
  #     ]
  #   }
  # ]
  # instance_requirements = [  # list(object)
  #   {
  #     accelerator_count = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     accelerator_manufacturers = []  # set(string)
  #     accelerator_names = []  # set(string)
  #     accelerator_total_memory_mib = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     accelerator_types = []  # set(string)
  #     allowed_instance_types = []  # set(string)
  #     bare_metal = ""
  #     baseline_ebs_bandwidth_mbps = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     burstable_performance = ""
  #     cpu_manufacturers = []  # set(string)
  #     excluded_instance_types = []  # set(string)
  #     instance_generations = []  # set(string)
  #     local_storage = ""
  #     local_storage_types = []  # set(string)
  #     max_spot_price_as_percentage_of_optimal_on_demand_price = 0
  #     memory_gib_per_vcpu = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     memory_mib = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     network_bandwidth_gbps = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     network_interface_count = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     on_demand_max_price_percentage_over_lowest_price = 0
  #     require_hibernate_support = false
  #     spot_max_price_percentage_over_lowest_price = 0
  #     total_local_storage_gb = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #     vcpu_count = [  # list(object)
  #       {
  #         max = 0
  #         min = 0
  #       }
  #     ]
  #   }
  # ]
  # instance_type                        = ""     # string | computed
  # kernel_id                            = ""     # string | computed
  # key_name                             = ""     # string | computed
  # latest_version                       = 0      # number | computed
  # license_specification = [  # list(object)
  #   {
  #     license_configuration_arn = ""
  #   }
  # ]
  # maintenance_options = [  # list(object)
  #   {
  #     auto_recovery = ""
  #   }
  # ]
  # metadata_options = [  # list(object)
  #   {
  #     http_endpoint = ""
  #     http_protocol_ipv6 = ""
  #     http_put_response_hop_limit = 0
  #     http_tokens = ""
  #     instance_metadata_tags = ""
  #   }
  # ]
  # monitoring = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # network_interfaces = [  # list(object)
  #   {
  #     associate_carrier_ip_address = ""
  #     associate_public_ip_address = ""
  #     connection_tracking_specification = [  # list(object)
  #       {
  #         tcp_established_timeout = 0
  #         udp_stream_timeout = 0
  #         udp_timeout = 0
  #       }
  #     ]
  #     delete_on_termination = ""
  #     description = ""
  #     device_index = 0
  #     interface_type = ""
  #     ipv4_address_count = 0
  #     ipv4_addresses = []  # set(string)
  #     ipv4_prefix_count = 0
  #     ipv4_prefixes = []  # set(string)
  #     ipv6_address_count = 0
  #     ipv6_addresses = []  # set(string)
  #     ipv6_prefix_count = 0
  #     ipv6_prefixes = []  # set(string)
  #     network_card_index = 0
  #     network_interface_id = ""
  #     primary_ipv6 = ""
  #     private_ip_address = ""
  #     security_groups = []  # set(string)
  #     subnet_id = ""
  #   }
  # ]
  # placement = [  # list(object)
  #   {
  #     affinity = ""
  #     availability_zone = ""
  #     group_name = ""
  #     host_id = ""
  #     host_resource_group_arn = ""
  #     partition_number = 0
  #     spread_domain = ""
  #     tenancy = ""
  #   }
  # ]
  # private_dns_name_options = [  # list(object)
  #   {
  #     enable_resource_name_dns_a_record = false
  #     enable_resource_name_dns_aaaa_record = false
  #     hostname_type = ""
  #   }
  # ]
  # ram_disk_id                          = ""     # string | computed
  # security_group_names                 = []     # set(string) | computed
  # tag_specifications = [  # list(object)
  #   {
  #     resource_type = ""
  #     tags = {}  # map(string)
  #   }
  # ]
  # user_data                            = ""     # string | computed
  # vpc_security_group_ids               = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

