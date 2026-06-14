# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_vpc_connection                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_vpc_connection" "this" {

  name                = ""     # string | required
  role_arn            = ""     # string | required
  security_group_ids  = []     # set(string) | required
  subnet_ids          = []     # set(string) | required
  vpc_connection_id   = ""     # string | required
  aws_account_id      = ""     # string | optional+computed
  dns_resolvers       = []     # set(string) | optional
  tags                = {}     # map(string) | optional

  # arn                 = ""     # string | computed
  # availability_status = ""     # string | computed
  # id                  = ""     # string | computed
  # tags_all            = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

