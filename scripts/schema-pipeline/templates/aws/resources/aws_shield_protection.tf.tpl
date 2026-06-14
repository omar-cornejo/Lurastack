# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_protection                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_protection" "this" {

  name         = ""     # string | required
  resource_arn = ""     # string | required
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

}

