# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_main_route_table_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_main_route_table_association" "this" {

  route_table_id          = ""     # string | required
  vpc_id                  = ""     # string | required
  id                      = ""     # string | optional+computed

  # original_route_table_id = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

