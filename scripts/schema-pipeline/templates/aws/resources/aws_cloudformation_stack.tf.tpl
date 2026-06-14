# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudformation_stack                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudformation_stack" "this" {

  name               = ""     # string | required
  capabilities       = []     # set(string) | optional
  disable_rollback   = false  # bool | optional
  iam_role_arn       = ""     # string | optional
  id                 = ""     # string | optional+computed
  notification_arns  = []     # set(string) | optional
  on_failure         = ""     # string | optional
  parameters         = {}     # map(string) | optional+computed
  policy_body        = ""     # string | optional+computed
  policy_url         = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed
  template_body      = ""     # string | optional+computed
  template_url       = ""     # string | optional
  timeout_in_minutes = 0      # number | optional

  # outputs            = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

