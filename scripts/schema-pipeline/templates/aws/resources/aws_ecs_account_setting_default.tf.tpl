# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_account_setting_default                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_account_setting_default" "this" {

  name          = ""     # string | required
  value         = ""     # string | required
  id            = ""     # string | optional+computed

  # principal_arn = ""     # string | computed

}

