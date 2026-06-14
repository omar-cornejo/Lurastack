# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_block_public_access_options                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_block_public_access_options" "this" {

  internet_gateway_block_mode = ""     # string | required

  # aws_account_id              = ""     # string | computed
  # aws_region                  = ""     # string | computed
  # id                          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

