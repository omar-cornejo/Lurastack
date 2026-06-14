# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_backup_selection                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_backup_selection" "this" {

  plan_id      = ""     # string | required
  selection_id = ""     # string | required
  id           = ""     # string | optional+computed

  # iam_role_arn = ""     # string | computed
  # name         = ""     # string | computed
  # resources    = []     # set(string) | computed

}

