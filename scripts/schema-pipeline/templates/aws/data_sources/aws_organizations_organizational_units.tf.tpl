# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_organizational_units                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_organizational_units" "this" {

  parent_id = ""     # string | required
  id        = ""     # string | optional+computed

  # children = [  # list(object)
  #   {
  #     arn = ""
  #     id = ""
  #     name = ""
  #   }
  # ]

}

