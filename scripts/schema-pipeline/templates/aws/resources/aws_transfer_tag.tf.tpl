# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_tag                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_tag" "this" {

  key          = ""     # string | required
  resource_arn = ""     # string | required
  value        = ""     # string | required
  id           = ""     # string | optional+computed

}

