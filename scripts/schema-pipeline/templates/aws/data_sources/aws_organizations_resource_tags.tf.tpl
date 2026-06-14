# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_resource_tags                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_resource_tags" "this" {

  resource_id = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

}

