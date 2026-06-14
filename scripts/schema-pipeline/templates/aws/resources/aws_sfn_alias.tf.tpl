# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sfn_alias                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sfn_alias" "this" {

  name          = ""     # string | required
  description   = ""     # string | optional
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # creation_date = ""     # string | computed

  routing_configuration { # list [1..*]
    state_machine_version_arn = ""     # string | required
    weight                    = 0      # number | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

