# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_group_membership                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_group_membership" "this" {

  group_name     = ""     # string | required
  member_name    = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  namespace      = ""     # string | optional

  # arn            = ""     # string | computed

}

