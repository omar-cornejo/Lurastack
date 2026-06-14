# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_resource_gateway                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_resource_gateway" "this" {

  name               = ""     # string | required
  subnet_ids         = []     # set(string) | required
  vpc_id             = ""     # string | required
  ip_address_type    = ""     # string | optional+computed
  security_group_ids = []     # set(string) | optional+computed
  tags               = {}     # map(string) | optional

  # arn                = ""     # string | computed
  # id                 = ""     # string | computed
  # status             = ""     # string | computed
  # tags_all           = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

