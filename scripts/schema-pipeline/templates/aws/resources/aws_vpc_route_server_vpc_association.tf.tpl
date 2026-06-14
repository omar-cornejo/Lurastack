# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_route_server_vpc_association                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_route_server_vpc_association" "this" {

  route_server_id = ""     # string | required
  vpc_id          = ""     # string | required

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

