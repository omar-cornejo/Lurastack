# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_private_dns                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_private_dns" "this" {

  private_dns_enabled = false  # bool | required
  vpc_endpoint_id     = ""     # string | required

}

