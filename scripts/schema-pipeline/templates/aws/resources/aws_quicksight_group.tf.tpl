# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_group                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_group" "this" {

  group_name     = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  description    = ""     # string | optional
  id             = ""     # string | optional+computed
  namespace      = ""     # string | optional

  # arn            = ""     # string | computed

}

