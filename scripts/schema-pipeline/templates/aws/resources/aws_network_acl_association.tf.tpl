# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_acl_association                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_acl_association" "this" {

  network_acl_id = ""     # string | required
  subnet_id      = ""     # string | required
  id             = ""     # string | optional+computed

}

