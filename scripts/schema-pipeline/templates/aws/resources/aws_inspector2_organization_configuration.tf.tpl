# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector2_organization_configuration           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector2_organization_configuration" "this" {

  id                        = ""     # string | optional+computed

  # max_account_limit_reached = false  # bool | computed

  auto_enable { # list [1..1]
    ec2         = false  # bool | required
    ecr         = false  # bool | required
    lambda      = false  # bool | optional
    lambda_code = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

