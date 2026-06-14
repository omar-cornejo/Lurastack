# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_security_group_association         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_security_group_association" "this" {

  security_group_id           = ""     # string | required
  vpc_endpoint_id             = ""     # string | required
  id                          = ""     # string | optional+computed
  replace_default_association = false  # bool | optional

}

