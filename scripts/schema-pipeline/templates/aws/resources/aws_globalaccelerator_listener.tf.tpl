# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_globalaccelerator_listener                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_globalaccelerator_listener" "this" {

  accelerator_arn = ""     # string | required
  protocol        = ""     # string | required
  client_affinity = ""     # string | optional
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

