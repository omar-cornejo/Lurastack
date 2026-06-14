# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_route_server_endpoint                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_route_server_endpoint" "this" {

  route_server_id          = ""     # string | required
  subnet_id                = ""     # string | required
  tags                     = {}     # map(string) | optional

  # arn                      = ""     # string | computed
  # eni_address              = ""     # string | computed
  # eni_id                   = ""     # string | computed
  # route_server_endpoint_id = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed
  # vpc_id                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

