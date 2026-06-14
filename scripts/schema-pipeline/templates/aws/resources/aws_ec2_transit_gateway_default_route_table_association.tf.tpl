# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_transit_gateway_default_route_table_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_transit_gateway_default_route_table_association" "this" {

  transit_gateway_id              = ""     # string | required
  transit_gateway_route_table_id  = ""     # string | required

  # id                              = ""     # string | computed
  # original_default_route_table_id = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

