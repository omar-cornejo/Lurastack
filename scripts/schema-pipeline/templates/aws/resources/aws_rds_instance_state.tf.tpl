# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_instance_state                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_instance_state" "this" {

  identifier = ""     # string | required
  state      = ""     # string | required

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

