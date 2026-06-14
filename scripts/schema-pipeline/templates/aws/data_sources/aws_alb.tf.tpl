# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_alb                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_alb" "this" {

  arn                                                          = ""     # string | optional+computed
  id                                                           = ""     # string | optional+computed
  name                                                         = ""     # string | optional+computed
  tags                                                         = {}     # map(string) | optional+computed

  # access_logs = [  # list(object)
  #   {
  #     bucket = ""
  #     enabled = false
  #     prefix = ""
  #   }
  # ]
  # arn_suffix                                                   = ""     # string | computed
  # client_keep_alive                                            = 0      # number | computed
  # connection_logs = [  # list(object)
  #   {
  #     bucket = ""
  #     enabled = false
  #     prefix = ""
  #   }
  # ]
  # customer_owned_ipv4_pool                                     = ""     # string | computed
  # desync_mitigation_mode                                       = ""     # string | computed
  # dns_name                                                     = ""     # string | computed
  # dns_record_client_routing_policy                             = ""     # string | computed
  # drop_invalid_header_fields                                   = false  # bool | computed
  # enable_cross_zone_load_balancing                             = false  # bool | computed
  # enable_deletion_protection                                   = false  # bool | computed
  # enable_http2                                                 = false  # bool | computed
  # enable_tls_version_and_cipher_suite_headers                  = false  # bool | computed
  # enable_waf_fail_open                                         = false  # bool | computed
  # enable_xff_client_port                                       = false  # bool | computed
  # enable_zonal_shift                                           = false  # bool | computed
  # enforce_security_group_inbound_rules_on_private_link_traffic = ""     # string | computed
  # idle_timeout                                                 = 0      # number | computed
  # internal                                                     = false  # bool | computed
  # ip_address_type                                              = ""     # string | computed
  # ipam_pools = [  # list(object)
  #   {
  #     ipv4_ipam_pool_id = ""
  #   }
  # ]
  # load_balancer_type                                           = ""     # string | computed
  # preserve_host_header                                         = false  # bool | computed
  # security_groups                                              = []     # set(string) | computed
  # subnet_mapping = [  # set(object)
  #   {
  #     allocation_id = ""
  #     ipv6_address = ""
  #     outpost_id = ""
  #     private_ipv4_address = ""
  #     subnet_id = ""
  #   }
  # ]
  # subnets                                                      = []     # set(string) | computed
  # vpc_id                                                       = ""     # string | computed
  # xff_header_processing_mode                                   = ""     # string | computed
  # zone_id                                                      = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

