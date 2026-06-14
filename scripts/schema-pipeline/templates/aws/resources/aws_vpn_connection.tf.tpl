# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpn_connection                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpn_connection" "this" {

  customer_gateway_id                     = ""     # string | required
  type                                    = ""     # string | required
  enable_acceleration                     = false  # bool | optional+computed
  id                                      = ""     # string | optional+computed
  local_ipv4_network_cidr                 = ""     # string | optional+computed
  local_ipv6_network_cidr                 = ""     # string | optional+computed
  outside_ip_address_type                 = ""     # string | optional+computed
  preshared_key_storage                   = ""     # string | optional+computed
  remote_ipv4_network_cidr                = ""     # string | optional+computed
  remote_ipv6_network_cidr                = ""     # string | optional+computed
  static_routes_only                      = false  # bool | optional+computed
  tags                                    = {}     # map(string) | optional
  tags_all                                = {}     # map(string) | optional+computed
  transit_gateway_id                      = ""     # string | optional
  transport_transit_gateway_attachment_id = ""     # string | optional
  tunnel1_dpd_timeout_action              = ""     # string | optional
  tunnel1_dpd_timeout_seconds             = 0      # number | optional
  tunnel1_enable_tunnel_lifecycle_control = false  # bool | optional
  tunnel1_ike_versions                    = []     # set(string) | optional
  tunnel1_inside_cidr                     = ""     # string | optional+computed
  tunnel1_inside_ipv6_cidr                = ""     # string | optional+computed
  tunnel1_phase1_dh_group_numbers         = []     # set(number) | optional
  tunnel1_phase1_encryption_algorithms    = []     # set(string) | optional
  tunnel1_phase1_integrity_algorithms     = []     # set(string) | optional
  tunnel1_phase1_lifetime_seconds         = 0      # number | optional
  tunnel1_phase2_dh_group_numbers         = []     # set(number) | optional
  tunnel1_phase2_encryption_algorithms    = []     # set(string) | optional
  tunnel1_phase2_integrity_algorithms     = []     # set(string) | optional
  tunnel1_phase2_lifetime_seconds         = 0      # number | optional
  tunnel1_preshared_key                   = ""     # string | optional+computed+sensitive
  tunnel1_rekey_fuzz_percentage           = 0      # number | optional
  tunnel1_rekey_margin_time_seconds       = 0      # number | optional
  tunnel1_replay_window_size              = 0      # number | optional
  tunnel1_startup_action                  = ""     # string | optional
  tunnel2_dpd_timeout_action              = ""     # string | optional
  tunnel2_dpd_timeout_seconds             = 0      # number | optional
  tunnel2_enable_tunnel_lifecycle_control = false  # bool | optional
  tunnel2_ike_versions                    = []     # set(string) | optional
  tunnel2_inside_cidr                     = ""     # string | optional+computed
  tunnel2_inside_ipv6_cidr                = ""     # string | optional+computed
  tunnel2_phase1_dh_group_numbers         = []     # set(number) | optional
  tunnel2_phase1_encryption_algorithms    = []     # set(string) | optional
  tunnel2_phase1_integrity_algorithms     = []     # set(string) | optional
  tunnel2_phase1_lifetime_seconds         = 0      # number | optional
  tunnel2_phase2_dh_group_numbers         = []     # set(number) | optional
  tunnel2_phase2_encryption_algorithms    = []     # set(string) | optional
  tunnel2_phase2_integrity_algorithms     = []     # set(string) | optional
  tunnel2_phase2_lifetime_seconds         = 0      # number | optional
  tunnel2_preshared_key                   = ""     # string | optional+computed+sensitive
  tunnel2_rekey_fuzz_percentage           = 0      # number | optional
  tunnel2_rekey_margin_time_seconds       = 0      # number | optional
  tunnel2_replay_window_size              = 0      # number | optional
  tunnel2_startup_action                  = ""     # string | optional
  tunnel_inside_ip_version                = ""     # string | optional+computed
  vpn_gateway_id                          = ""     # string | optional

  # arn                                     = ""     # string | computed
  # core_network_arn                        = ""     # string | computed
  # core_network_attachment_arn             = ""     # string | computed
  # customer_gateway_configuration          = ""     # string | computed+sensitive
  # preshared_key_arn                       = ""     # string | computed
  # routes = [  # set(object)
  #   {
  #     destination_cidr_block = ""
  #     source = ""
  #     state = ""
  #   }
  # ]
  # transit_gateway_attachment_id           = ""     # string | computed
  # tunnel1_address                         = ""     # string | computed
  # tunnel1_bgp_asn                         = ""     # string | computed
  # tunnel1_bgp_holdtime                    = 0      # number | computed
  # tunnel1_cgw_inside_address              = ""     # string | computed
  # tunnel1_vgw_inside_address              = ""     # string | computed
  # tunnel2_address                         = ""     # string | computed
  # tunnel2_bgp_asn                         = ""     # string | computed
  # tunnel2_bgp_holdtime                    = 0      # number | computed
  # tunnel2_cgw_inside_address              = ""     # string | computed
  # tunnel2_vgw_inside_address              = ""     # string | computed
  # vgw_telemetry = [  # set(object)
  #   {
  #     accepted_route_count = 0
  #     certificate_arn = ""
  #     last_status_change = ""
  #     outside_ip_address = ""
  #     status = ""
  #     status_message = ""
  #   }
  # ]

  tunnel1_log_options { # list [0..1]

    cloudwatch_log_options { # list [0..1]
      log_enabled       = false  # bool | optional
      log_group_arn     = ""     # string | optional
      log_output_format = ""     # string | optional

    }

  }

  tunnel2_log_options { # list [0..1]

    cloudwatch_log_options { # list [0..1]
      log_enabled       = false  # bool | optional
      log_group_arn     = ""     # string | optional
      log_output_format = ""     # string | optional

    }

  }

}

