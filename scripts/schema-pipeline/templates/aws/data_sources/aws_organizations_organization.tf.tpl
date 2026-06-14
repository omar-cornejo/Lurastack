# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_organization                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_organization" "this" {

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
  # aws_service_access_principals = []     # set(string) | computed
  # enabled_policy_types          = []     # set(string) | computed
  # feature_set                   = ""     # string | computed
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

