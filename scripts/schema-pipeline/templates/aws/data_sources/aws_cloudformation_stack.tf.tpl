# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudformation_stack                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudformation_stack" "this" {

  name               = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # capabilities       = []     # set(string) | computed
  # description        = ""     # string | computed
  # disable_rollback   = false  # bool | computed
  # iam_role_arn       = ""     # string | computed
  # notification_arns  = []     # set(string) | computed
  # outputs            = {}     # map(string) | computed
  # parameters         = {}     # map(string) | computed
  # template_body      = ""     # string | computed
  # timeout_in_minutes = 0      # number | computed

}

