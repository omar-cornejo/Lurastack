# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_secretsmanager_secret_rotation                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_secretsmanager_secret_rotation" "this" {

  secret_id           = ""     # string | required
  id                  = ""     # string | optional+computed

  # rotation_enabled    = false  # bool | computed
  # rotation_lambda_arn = ""     # string | computed
  # rotation_rules = [  # list(object)
  #   {
  #     automatically_after_days = 0
  #     duration = ""
  #     schedule_expression = ""
  #   }
  # ]

}

