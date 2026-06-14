# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_protection_group                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_protection_group" "this" {

  aggregation          = ""     # string | required
  pattern              = ""     # string | required
  protection_group_id  = ""     # string | required
  id                   = ""     # string | optional+computed
  members              = []     # list(string) | optional
  resource_type        = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # protection_group_arn = ""     # string | computed

}

