# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_delegated_administrators              │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_delegated_administrators" "this" {

  id                       = ""     # string | optional+computed
  service_principal        = ""     # string | optional

  # delegated_administrators = [  # set(object)
  #   {
  #     arn = ""
  #     delegation_enabled_date = ""
  #     email = ""
  #     id = ""
  #     joined_method = ""
  #     joined_timestamp = ""
  #     name = ""
  #     status = ""
  #   }
  # ]

}

