# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_secretsmanager_secret_version                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_secretsmanager_secret_version" "this" {

  secret_id      = ""     # string | required
  id             = ""     # string | optional+computed
  version_id     = ""     # string | optional+computed
  version_stage  = ""     # string | optional

  # arn            = ""     # string | computed
  # created_date   = ""     # string | computed
  # secret_binary  = ""     # string | computed+sensitive
  # secret_string  = ""     # string | computed+sensitive
  # version_stages = []     # set(string) | computed

}

