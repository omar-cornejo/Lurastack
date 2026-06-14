# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_route_server_propagation                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_route_server_propagation" "this" {

  route_server_id = ""     # string | required
  route_table_id  = ""     # string | required

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

