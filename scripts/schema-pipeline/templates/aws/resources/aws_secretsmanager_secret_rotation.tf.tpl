# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_secretsmanager_secret_rotation                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_secretsmanager_secret_rotation" "this" {

  secret_id           = ""     # string | required
  id                  = ""     # string | optional+computed
  rotate_immediately  = false  # bool | optional
  rotation_lambda_arn = ""     # string | optional

  # rotation_enabled    = false  # bool | computed

  rotation_rules { # list [1..1]
    automatically_after_days = 0      # number | optional
    duration                 = ""     # string | optional
    schedule_expression      = ""     # string | optional

  }

}

