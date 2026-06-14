# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_organization                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_organization" "this" {

  aws_service_access_principals = []     # set(string) | optional
  enabled_policy_types          = []     # set(string) | optional
  feature_set                   = ""     # string | optional
  id                            = ""     # string | optional+computed

  # accounts = [  # list(object)
  #   {
  #     arn = ""
  #     email = ""
  #     id = ""
  #     name = ""
  #     status = ""
  #   }
  # ]
  # arn                           = ""     # string | computed
  # master_account_arn            = ""     # string | computed
  # master_account_email          = ""     # string | computed
  # master_account_id             = ""     # string | computed
  # master_account_name           = ""     # string | computed
  # non_master_accounts = [  # list(object)
  #   {
  #     arn = ""
  #     email = ""
  #     id = ""
  #     name = ""
  #     status = ""
  #   }
  # ]
  # roots = [  # list(object)
  #   {
  #     arn = ""
  #     id = ""
  #     name = ""
  #     policy_types = [  # list(object)
  #       {
  #         status = ""
  #         type = ""
  #       }
  #     ]
  #   }
  # ]

}

