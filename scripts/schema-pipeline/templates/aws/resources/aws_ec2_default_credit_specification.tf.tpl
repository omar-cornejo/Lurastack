# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_default_credit_specification                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_default_credit_specification" "this" {

  cpu_credits     = ""     # string | required
  instance_family = ""     # string | required

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

