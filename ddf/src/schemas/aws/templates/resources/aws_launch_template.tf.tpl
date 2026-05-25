# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_launch_template                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_launch_template" "this" {

  default_version                      = 0      # number | optional+computed
  description                          = ""     # string | optional
  disable_api_stop                     = false  # bool | optional
  disable_api_termination              = false  # bool | optional
  ebs_optimized                        = ""     # string | optional
  id                                   = ""     # string | optional+computed
  image_id                             = ""     # string | optional
  instance_initiated_shutdown_behavior = ""     # string | optional
  instance_type                        = ""     # string | optional
  kernel_id                            = ""     # string | optional
  key_name                             = ""     # string | optional
  name                                 = ""     # string | optional+computed
  name_prefix                          = ""     # string | optional+computed
  ram_disk_id                          = ""     # string | optional
  security_group_names                 = []     # set(string) | optional
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed
  update_default_version               = false  # bool | optional
  user_data                            = ""     # string | optional
  vpc_security_group_ids               = []     # set(string) | optional

  # arn                                  = ""     # string | computed
  # latest_version                       = 0      # number | computed

  block_device_mappings { # list
    device_name  = ""     # string | optional
    no_device    = ""     # string | optional
    virtual_name = ""     # string | optional

    ebs { # list [0..1]
      delete_on_termination      = ""     # string | optional
      encrypted                  = ""     # string | optional
      iops                       = 0      # number | optional+computed
      kms_key_id                 = ""     # string | optional
      snapshot_id                = ""     # string | optional
      throughput                 = 0      # number | optional+computed
      volume_initialization_rate = 0      # number | optional+computed
      volume_size                = 0      # number | optional+computed
      volume_type                = ""     # string | optional+computed

    }

  }

  capacity_reservation_specification { # list [0..1]
    capacity_reservation_preference = ""     # string | optional

    capacity_reservation_target { # list [0..1]
      capacity_reservation_id                 = ""     # string | optional
      capacity_reservation_resource_group_arn = ""     # string | optional

    }

  }

  cpu_options { # list [0..1]
    amd_sev_snp      = ""     # string | optional
    core_count       = 0      # number | optional
    threads_per_core = 0      # number | optional

  }

  credit_specification { # list [0..1]
    cpu_credits = ""     # string | optional

  }

  elastic_gpu_specifications { # list DEPRECATED
    type = ""     # string | required

  }

  elastic_inference_accelerator { # list [0..1] DEPRECATED
    type = ""     # string | required

  }

  enclave_options { # list [0..1]
    enabled = false  # bool | optional

  }

  hibernation_options { # list [0..1]
    configured = false  # bool | required

  }

  iam_instance_profile { # list [0..1]
    arn  = ""     # string | optional
    name = ""     # string | optional

  }

  instance_market_options { # list [0..1]
    market_type = ""     # string | optional

    spot_options { # list [0..1]
      block_duration_minutes         = 0      # number | optional
      instance_interruption_behavior = ""     # string | optional
      max_price                      = ""     # string | optional
      spot_instance_type             = ""     # string | optional
      valid_until                    = ""     # string | optional+computed

    }

  }

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

  license_specification { # set
    license_configuration_arn = ""     # string | required

  }

  maintenance_options { # list [0..1]
    auto_recovery = ""     # string | optional

  }

  metadata_options { # list [0..1]
    http_endpoint               = ""     # string | optional+computed
    http_protocol_ipv6          = ""     # string | optional+computed
    http_put_response_hop_limit = 0      # number | optional+computed
    http_tokens                 = ""     # string | optional+computed
    instance_metadata_tags      = ""     # string | optional+computed

  }

  monitoring { # list [0..1]
    enabled = false  # bool | optional

  }

  network_interfaces { # list
    associate_carrier_ip_address = ""     # string | optional
    associate_public_ip_address  = ""     # string | optional
    delete_on_termination        = ""     # string | optional
    description                  = ""     # string | optional
    device_index                 = 0      # number | optional
    interface_type               = ""     # string | optional
    ipv4_address_count           = 0      # number | optional
    ipv4_addresses               = []     # set(string) | optional
    ipv4_prefix_count            = 0      # number | optional
    ipv4_prefixes                = []     # set(string) | optional
    ipv6_address_count           = 0      # number | optional
    ipv6_addresses               = []     # set(string) | optional
    ipv6_prefix_count            = 0      # number | optional
    ipv6_prefixes                = []     # set(string) | optional
    network_card_index           = 0      # number | optional
    network_interface_id         = ""     # string | optional
    primary_ipv6                 = ""     # string | optional
    private_ip_address           = ""     # string | optional
    security_groups              = []     # set(string) | optional
    subnet_id                    = ""     # string | optional

    connection_tracking_specification { # list [0..1]
      tcp_established_timeout = 0      # number | optional
      udp_stream_timeout      = 0      # number | optional
      udp_timeout             = 0      # number | optional

    }

    ena_srd_specification { # list [0..1]
      ena_srd_enabled = false  # bool | optional

      ena_srd_udp_specification { # list [0..1]
        ena_srd_udp_enabled = false  # bool | optional

      }

    }

  }

  placement { # list [0..1]
    affinity                = ""     # string | optional
    availability_zone       = ""     # string | optional
    group_name              = ""     # string | optional
    host_id                 = ""     # string | optional
    host_resource_group_arn = ""     # string | optional
    partition_number        = 0      # number | optional
    spread_domain           = ""     # string | optional
    tenancy                 = ""     # string | optional

  }

  private_dns_name_options { # list [0..1]
    enable_resource_name_dns_a_record    = false  # bool | optional
    enable_resource_name_dns_aaaa_record = false  # bool | optional
    hostname_type                        = ""     # string | optional

  }

  tag_specifications { # list
    resource_type = ""     # string | optional
    tags          = {}     # map(string) | optional

  }

}

