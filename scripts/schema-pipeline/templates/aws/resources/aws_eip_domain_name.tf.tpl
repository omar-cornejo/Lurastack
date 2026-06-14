# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eip_domain_name                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eip_domain_name" "this" {

  allocation_id = ""     # string | required
  domain_name   = ""     # string | required

  # id            = ""     # string | computed
  # ptr_record    = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

