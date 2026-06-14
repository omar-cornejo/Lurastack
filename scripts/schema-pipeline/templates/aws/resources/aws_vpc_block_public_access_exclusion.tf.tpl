# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_block_public_access_exclusion               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_block_public_access_exclusion" "this" {

  internet_gateway_exclusion_mode = ""     # string | required
  subnet_id                       = ""     # string | optional
  tags                            = {}     # map(string) | optional
  vpc_id                          = ""     # string | optional

  # id                              = ""     # string | computed
  # resource_arn                    = ""     # string | computed
  # tags_all                        = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

