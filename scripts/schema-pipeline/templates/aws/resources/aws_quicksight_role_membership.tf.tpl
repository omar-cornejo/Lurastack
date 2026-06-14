# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_role_membership                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_role_membership" "this" {

  member_name    = ""     # string | required
  role           = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  namespace      = ""     # string | optional+computed

}

