# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_dhcp_options_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_dhcp_options_association" "this" {

  dhcp_options_id = ""     # string | required
  vpc_id          = ""     # string | required
  id              = ""     # string | optional+computed

}

