# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_route_table_association            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_route_table_association" "this" {

  route_table_id  = ""     # string | required
  vpc_endpoint_id = ""     # string | required
  id              = ""     # string | optional+computed

}

