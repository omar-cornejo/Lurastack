# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_customer_gateway_association     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_customer_gateway_association" "this" {

  customer_gateway_arn = ""     # string | required
  device_id            = ""     # string | required
  global_network_id    = ""     # string | required
  id                   = ""     # string | optional+computed
  link_id              = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

