# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_delegated_services                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_delegated_services" "this" {

  account_id         = ""     # string | required
  id                 = ""     # string | optional+computed

  # delegated_services = [  # set(object)
  #   {
  #     delegation_enabled_date = ""
  #     service_principal = ""
  #   }
  # ]

}

