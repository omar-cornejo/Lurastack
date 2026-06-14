# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_resource_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_resource_policy" "this" {

  content  = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

}

