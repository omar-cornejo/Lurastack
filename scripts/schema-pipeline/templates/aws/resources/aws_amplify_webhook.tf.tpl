# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_amplify_webhook                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_amplify_webhook" "this" {

  app_id      = ""     # string | required
  branch_name = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # url         = ""     # string | computed

}

