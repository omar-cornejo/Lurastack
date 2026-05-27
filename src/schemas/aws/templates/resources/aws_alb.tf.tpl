# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_alb                                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_alb" "this" {

  client_keep_alive                                            = 0      # number | optional
  customer_owned_ipv4_pool                                     = ""     # string | optional
  desync_mitigation_mode                                       = ""     # string | optional
  dns_record_client_routing_policy                             = ""     # string | optional
  drop_invalid_header_fields                                   = false  # bool | optional
  enable_cross_zone_load_balancing                             = false  # bool | optional
  enable_deletion_protection                                   = false  # bool | optional
  enable_http2                                                 = false  # bool | optional
  enable_tls_version_and_cipher_suite_headers                  = false  # bool | optional
  enable_waf_fail_open                                         = false  # bool | optional
  enable_xff_client_port                                       = false  # bool | optional
  enable_zonal_shift                                           = false  # bool | optional
  enforce_security_group_inbound_rules_on_private_link_traffic = ""     # string | optional+computed
  id                                                           = ""     # string | optional+computed
  idle_timeout                                                 = 0      # number | optional
  internal                                                     = false  # bool | optional+computed
  ip_address_type                                              = ""     # string | optional+computed
  load_balancer_type                                           = ""     # string | optional
  name                                                         = ""     # string | optional+computed
  name_prefix                                                  = ""     # string | optional+computed
  preserve_host_header                                         = false  # bool | optional
  security_groups                                              = []     # set(string) | optional+computed
  subnets                                                      = []     # set(string) | optional+computed
  tags                                                         = {}     # map(string) | optional
  tags_all                                                     = {}     # map(string) | optional+computed
  xff_header_processing_mode                                   = ""     # string | optional

  # arn                                                          = ""     # string | computed
  # arn_suffix                                                   = ""     # string | computed
  # dns_name                                                     = ""     # string | computed
  # vpc_id                                                       = ""     # string | computed
  # zone_id                                                      = ""     # string | computed

  access_logs { # list [0..1]
    bucket  = ""     # string | required
    enabled = false  # bool | optional
    prefix  = ""     # string | optional

  }

  connection_logs { # list [0..1]
    bucket  = ""     # string | required
    enabled = false  # bool | optional
    prefix  = ""     # string | optional

  }

  ipam_pools { # list [0..1]
    ipv4_ipam_pool_id = ""     # string | required

  }

  minimum_load_balancer_capacity { # list [0..1]
    capacity_units = 0      # number | required

  }

  subnet_mapping { # set
    subnet_id            = ""     # string | required
    allocation_id        = ""     # string | optional
    ipv6_address         = ""     # string | optional
    private_ipv4_address = ""     # string | optional

    # outpost_id           = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

