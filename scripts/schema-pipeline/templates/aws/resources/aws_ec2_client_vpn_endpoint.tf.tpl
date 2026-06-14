# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_client_vpn_endpoint                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_client_vpn_endpoint" "this" {

  client_cidr_block             = ""     # string | required
  server_certificate_arn        = ""     # string | required
  description                   = ""     # string | optional
  disconnect_on_session_timeout = false  # bool | optional+computed
  dns_servers                   = []     # list(string) | optional
  id                            = ""     # string | optional+computed
  security_group_ids            = []     # set(string) | optional+computed
  self_service_portal           = ""     # string | optional
  session_timeout_hours         = 0      # number | optional
  split_tunnel                  = false  # bool | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  transport_protocol            = ""     # string | optional
  vpc_id                        = ""     # string | optional+computed
  vpn_port                      = 0      # number | optional

  # arn                           = ""     # string | computed
  # dns_name                      = ""     # string | computed
  # self_service_portal_url       = ""     # string | computed

  authentication_options { # set [1..2]
    type                           = ""     # string | required
    active_directory_id            = ""     # string | optional
    root_certificate_chain_arn     = ""     # string | optional
    saml_provider_arn              = ""     # string | optional
    self_service_saml_provider_arn = ""     # string | optional

  }

  client_connect_options { # list [0..1]
    enabled             = false  # bool | optional+computed
    lambda_function_arn = ""     # string | optional+computed

  }

  client_login_banner_options { # list [0..1]
    banner_text = ""     # string | optional+computed
    enabled     = false  # bool | optional+computed

  }

  client_route_enforcement_options { # list [0..1]
    enforced = false  # bool | optional+computed

  }

  connection_log_options { # list [1..1]
    enabled               = false  # bool | required
    cloudwatch_log_group  = ""     # string | optional
    cloudwatch_log_stream = ""     # string | optional+computed

  }

}

