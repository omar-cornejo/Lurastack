# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_globalaccelerator_custom_routing_accelerator    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_globalaccelerator_custom_routing_accelerator" "this" {

  name            = ""     # string | required
  enabled         = false  # bool | optional
  id              = ""     # string | optional+computed
  ip_address_type = ""     # string | optional
  ip_addresses    = []     # list(string) | optional
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # dns_name        = ""     # string | computed
  # hosted_zone_id  = ""     # string | computed
  # ip_sets = [  # list(object)
  #   {
  #     ip_addresses = []  # list(string)
  #     ip_family = ""
  #   }
  # ]

  attributes { # list [0..1]
    flow_logs_enabled   = false  # bool | optional
    flow_logs_s3_bucket = ""     # string | optional
    flow_logs_s3_prefix = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

