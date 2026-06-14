# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_drt_access_role_arn_association          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_drt_access_role_arn_association" "this" {

  role_arn = ""     # string | required

  # id       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

