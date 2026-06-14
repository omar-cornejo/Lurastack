# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_client_vpn_authorization_rule               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_client_vpn_authorization_rule" "this" {

  client_vpn_endpoint_id = ""     # string | required
  target_network_cidr    = ""     # string | required
  access_group_id        = ""     # string | optional
  authorize_all_groups   = false  # bool | optional
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

