# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_organizational_unit               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_organizational_unit" "this" {

  name      = ""     # string | required
  parent_id = ""     # string | required
  id        = ""     # string | optional+computed
  tags      = {}     # map(string) | optional
  tags_all  = {}     # map(string) | optional+computed

  # accounts = [  # list(object)
  #   {
  #     arn = ""
  #     email = ""
  #     id = ""
  #     name = ""
  #   }
  # ]
  # arn       = ""     # string | computed

}

