# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_controltower_control                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_controltower_control" "this" {

  control_identifier = ""     # string | required
  target_identifier  = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed

  parameters { # set
    key   = ""     # string | required
    value = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

