# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_instance                                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_instance" "this" {

  ami                                  = ""     # string | optional+computed
  associate_public_ip_address          = false  # bool | optional+computed
  availability_zone                    = ""     # string | optional+computed
  cpu_core_count                       = 0      # number | optional+computed
  cpu_threads_per_core                 = 0      # number | optional+computed
  disable_api_stop                     = false  # bool | optional+computed
  disable_api_termination              = false  # bool | optional+computed
  ebs_optimized                        = false  # bool | optional+computed
  enable_primary_ipv6                  = false  # bool | optional+computed
  get_password_data                    = false  # bool | optional
  hibernation                          = false  # bool | optional
  host_id                              = ""     # string | optional+computed
  host_resource_group_arn              = ""     # string | optional+computed
  iam_instance_profile                 = ""     # string | optional+computed
  id                                   = ""     # string | optional+computed
  instance_initiated_shutdown_behavior = ""     # string | optional+computed
  instance_type                        = ""     # string | optional+computed
  ipv6_address_count                   = 0      # number | optional+computed
  ipv6_addresses                       = []     # list of string | optional+computed
  key_name                             = ""     # string | optional+computed
  monitoring                           = false  # bool | optional+computed
  placement_group                      = ""     # string | optional+computed
  placement_partition_number           = 0      # number | optional+computed
  private_ip                           = ""     # string | optional+computed
  secondary_private_ips                = []     # set of string | optional+computed
  security_groups                      = []     # set of string | optional+computed
  source_dest_check                    = false  # bool | optional
  subnet_id                            = ""     # string | optional+computed
  tags                                 = {}     # map of string | optional
  tags_all                             = {}     # map of string | optional+computed
  tenancy                              = ""     # string | optional+computed
  user_data                            = ""     # string | optional+computed
  user_data_base64                     = ""     # string | optional+computed
  user_data_replace_on_change          = false  # bool | optional
  volume_tags                          = {}     # map of string | optional
  vpc_security_group_ids               = []     # set of string | optional+computed
  # arn                                  = ... # string | computed
  # instance_lifecycle                   = ... # string | computed
  # instance_state                       = ... # string | computed
  # outpost_arn                          = ... # string | computed
  # password_data                        = ... # string | computed
  # primary_network_interface_id         = ... # string | computed
  # private_dns                          = ... # string | computed
  # public_dns                           = ... # string | computed
  # public_ip                            = ... # string | computed
  # spot_instance_request_id             = ... # string | computed

  capacity_reservation_specification { # [0..1]
    capacity_reservation_preference = ""     # string | optional

    capacity_reservation_target { # [0..1]
      capacity_reservation_id                 = ""     # string | optional
      capacity_reservation_resource_group_arn = ""     # string | optional

    }

  }

  cpu_options { # [0..1]
    amd_sev_snp      = ""     # string | optional+computed
    core_count       = 0      # number | optional+computed
    threads_per_core = 0      # number | optional+computed

  }

  credit_specification { # [0..1]
    cpu_credits = ""     # string | optional

  }

  ebs_block_device {
    device_name           = ""     # string | required
    delete_on_termination = false  # bool | optional
    encrypted             = false  # bool | optional+computed
    iops                  = 0      # number | optional+computed
    kms_key_id            = ""     # string | optional+computed
    snapshot_id           = ""     # string | optional+computed
    tags                  = {}     # map of string | optional
    tags_all              = {}     # map of string | optional+computed
    throughput            = 0      # number | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional+computed
    # volume_id             = ... # string | computed

  }

  enclave_options { # [0..1]
    enabled = false  # bool | optional+computed

  }

  ephemeral_block_device {
    device_name  = ""     # string | required
    no_device    = false  # bool | optional
    virtual_name = ""     # string | optional

  }

  instance_market_options { # [0..1]
    market_type = ""     # string | optional+computed

    spot_options { # [0..1]
      instance_interruption_behavior = ""     # string | optional+computed
      max_price                      = ""     # string | optional+computed
      spot_instance_type             = ""     # string | optional+computed
      valid_until                    = ""     # string | optional+computed

    }

  }

  launch_template { # [0..1]
    id      = ""     # string | optional+computed
    name    = ""     # string | optional+computed
    version = ""     # string | optional

  }

  maintenance_options { # [0..1]
    auto_recovery = ""     # string | optional+computed

  }

  metadata_options { # [0..1]
    http_endpoint               = ""     # string | optional
    http_protocol_ipv6          = ""     # string | optional
    http_put_response_hop_limit = 0      # number | optional+computed
    http_tokens                 = ""     # string | optional+computed
    instance_metadata_tags      = ""     # string | optional+computed

  }

  network_interface {
    device_index          = 0      # number | required
    network_interface_id  = ""     # string | required
    delete_on_termination = false  # bool | optional
    network_card_index    = 0      # number | optional

  }

  private_dns_name_options { # [0..1]
    enable_resource_name_dns_a_record    = false  # bool | optional+computed
    enable_resource_name_dns_aaaa_record = false  # bool | optional+computed
    hostname_type                        = ""     # string | optional+computed

  }

  root_block_device { # [0..1]
    delete_on_termination = false  # bool | optional
    encrypted             = false  # bool | optional+computed
    iops                  = 0      # number | optional+computed
    kms_key_id            = ""     # string | optional+computed
    tags                  = {}     # map of string | optional
    tags_all              = {}     # map of string | optional+computed
    throughput            = 0      # number | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional+computed
    # device_name           = ... # string | computed
    # volume_id             = ... # string | computed

  }

  timeouts {
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

