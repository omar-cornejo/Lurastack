# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acmpca_policy                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acmpca_policy" "this" {

  policy       = ""     # string | required
  resource_arn = ""     # string | required
  id           = ""     # string | optional+computed

}

