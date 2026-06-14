# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_action_target                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_action_target" "this" {

  description = ""     # string | required
  identifier  = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed

}

