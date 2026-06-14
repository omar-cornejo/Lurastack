# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_secretsmanager_secret_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_secretsmanager_secret_policy" "this" {

  policy              = ""     # string | required
  secret_arn          = ""     # string | required
  block_public_policy = false  # bool | optional
  id                  = ""     # string | optional+computed

}

