# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_globalaccelerator_custom_routing_endpoint_group  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_globalaccelerator_custom_routing_endpoint_group" "this" {

  listener_arn          = ""     # string | required
  endpoint_group_region = ""     # string | optional+computed
  id                    = ""     # string | optional+computed

  # arn                   = ""     # string | computed

  destination_configuration { # set [1..*]
    from_port = 0      # number | required
    protocols = []     # set(string) | required
    to_port   = 0      # number | required

  }

  endpoint_configuration { # set
    endpoint_id = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

