# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_iam_policy_assignment                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_iam_policy_assignment" "this" {

  assignment_name   = ""     # string | required
  assignment_status = ""     # string | required
  aws_account_id    = ""     # string | optional+computed
  namespace         = ""     # string | optional+computed
  policy_arn        = ""     # string | optional

  # assignment_id     = ""     # string | computed
  # id                = ""     # string | computed

  identities { # list
    group = []     # set(string) | optional
    user  = []     # set(string) | optional

  }

}

