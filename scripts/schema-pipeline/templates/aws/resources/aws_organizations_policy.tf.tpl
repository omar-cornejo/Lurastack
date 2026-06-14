# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_policy" "this" {

  content      = ""     # string | required
  name         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  skip_destroy = false  # bool | optional
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed
  type         = ""     # string | optional

  # arn          = ""     # string | computed

}

