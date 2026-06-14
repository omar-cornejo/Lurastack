# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_client_vpn_endpoint                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_client_vpn_endpoint" "this" {

  client_vpn_endpoint_id           = ""     # string | optional+computed
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # authentication_options = [  # list(object)
  #   {
  #     active_directory_id = ""
  #     root_certificate_chain_arn = ""
  #     saml_provider_arn = ""
  #     self_service_saml_provider_arn = ""
  #     type = ""
  #   }
  # ]
  # client_cidr_block                = ""     # string | computed
  # client_connect_options = [  # list(object)
  #   {
  #     enabled = false
  #     lambda_function_arn = ""
  #   }
  # ]
  # client_login_banner_options = [  # list(object)
  #   {
  #     banner_text = ""
  #     enabled = false
  #   }
  # ]
  # client_route_enforcement_options = [  # list(object)
  #   {
  #     enforced = false
  #   }
  # ]
  # connection_log_options = [  # list(object)
  #   {
  #     cloudwatch_log_group = ""
  #     cloudwatch_log_stream = ""
  #     enabled = false
  #   }
  # ]
  # description                      = ""     # string | computed
  # dns_name                         = ""     # string | computed
  # dns_servers                      = []     # list(string) | computed
  # security_group_ids               = []     # list(string) | computed
  # self_service_portal              = ""     # string | computed
  # self_service_portal_url          = ""     # string | computed
  # server_certificate_arn           = ""     # string | computed
  # session_timeout_hours            = 0      # number | computed
  # split_tunnel                     = false  # bool | computed
  # transport_protocol               = ""     # string | computed
  # vpc_id                           = ""     # string | computed
  # vpn_port                         = 0      # number | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

