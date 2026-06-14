# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route_table_association                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route_table_association" "this" {

  route_table_id = ""     # string | required
  gateway_id     = ""     # string | optional
  id             = ""     # string | optional+computed
  subnet_id      = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

