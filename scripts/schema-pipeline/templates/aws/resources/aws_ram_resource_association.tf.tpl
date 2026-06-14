# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ram_resource_association                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ram_resource_association" "this" {

  resource_arn       = ""     # string | required
  resource_share_arn = ""     # string | required
  id                 = ""     # string | optional+computed

}

