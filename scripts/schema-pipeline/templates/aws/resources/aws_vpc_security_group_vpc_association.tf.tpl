# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_security_group_vpc_association              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_security_group_vpc_association" "this" {

  security_group_id = ""     # string | required
  vpc_id            = ""     # string | required

  # state             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

