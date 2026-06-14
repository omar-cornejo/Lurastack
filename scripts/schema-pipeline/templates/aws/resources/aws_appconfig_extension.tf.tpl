# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_extension                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_extension" "this" {

  name        = ""     # string | required
  description = ""     # string | optional+computed
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # version     = 0      # number | computed

  action_point { # set [1..*]
    point = ""     # string | required

    action { # set [1..*]
      name        = ""     # string | required
      uri         = ""     # string | required
      description = ""     # string | optional
      role_arn    = ""     # string | optional

    }

  }

  parameter { # set
    name        = ""     # string | required
    description = ""     # string | optional
    required    = false  # bool | optional

  }

}

