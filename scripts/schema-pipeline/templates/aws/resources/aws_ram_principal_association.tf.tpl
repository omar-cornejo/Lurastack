# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ram_principal_association                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ram_principal_association" "this" {

  principal          = ""     # string | required
  resource_share_arn = ""     # string | required
  id                 = ""     # string | optional+computed

}

