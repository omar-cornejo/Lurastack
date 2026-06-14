# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_quicksight_group                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_quicksight_group" "this" {

  group_name     = ""     # string | required
  aws_account_id = ""     # string | optional+computed
  id             = ""     # string | optional+computed
  namespace      = ""     # string | optional

  # arn            = ""     # string | computed
  # description    = ""     # string | computed
  # principal_id   = ""     # string | computed

}

