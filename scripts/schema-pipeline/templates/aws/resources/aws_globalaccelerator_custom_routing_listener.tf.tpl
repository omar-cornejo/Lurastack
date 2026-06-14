# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_globalaccelerator_custom_routing_listener       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_globalaccelerator_custom_routing_listener" "this" {

  accelerator_arn = ""     # string | required
  id              = ""     # string | optional+computed

  # arn             = ""     # string | computed

  port_range { # set [1..10]
    from_port = 0      # number | optional
    to_port   = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

