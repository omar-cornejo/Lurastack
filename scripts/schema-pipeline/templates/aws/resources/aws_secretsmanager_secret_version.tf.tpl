# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_secretsmanager_secret_version                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_secretsmanager_secret_version" "this" {

  secret_id                = ""     # string | required
  id                       = ""     # string | optional+computed
  secret_binary            = ""     # string | optional+sensitive
  secret_string            = ""     # string | optional+sensitive
  secret_string_wo         = ""     # string | optional+sensitive+write_only
  secret_string_wo_version = 0      # number | optional
  version_stages           = []     # set(string) | optional+computed

  # arn                      = ""     # string | computed
  # has_secret_string_wo     = false  # bool | computed
  # version_id               = ""     # string | computed

}

