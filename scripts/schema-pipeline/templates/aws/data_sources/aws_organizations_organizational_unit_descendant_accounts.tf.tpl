# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_organizational_unit_descendant_accounts  │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_organizational_unit_descendant_accounts" "this" {

  parent_id = ""     # string | required
  id        = ""     # string | optional+computed

  # accounts = [  # list(object)
  #   {
  #     arn = ""
  #     email = ""
  #     id = ""
  #     name = ""
  #     status = ""
  #   }
  # ]

}

