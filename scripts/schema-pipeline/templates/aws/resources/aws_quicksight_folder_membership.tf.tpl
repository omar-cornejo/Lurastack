# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_folder_membership                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_folder_membership" "this" {

  folder_id      = ""     # string | required
  member_id      = ""     # string | required
  member_type    = ""     # string | required
  aws_account_id = ""     # string | optional+computed

  # id             = ""     # string | computed

}

