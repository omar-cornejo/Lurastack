# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_organizational_unit                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_organizational_unit" "this" {

  name      = ""     # string | required
  parent_id = ""     # string | required
  id        = ""     # string | optional+computed

  # arn       = ""     # string | computed

}

