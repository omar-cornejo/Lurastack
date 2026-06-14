# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_secretsmanager_random_password                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_secretsmanager_random_password" "this" {

  exclude_characters         = ""     # string | optional
  exclude_lowercase          = false  # bool | optional
  exclude_numbers            = false  # bool | optional
  exclude_punctuation        = false  # bool | optional
  exclude_uppercase          = false  # bool | optional
  id                         = ""     # string | optional+computed
  include_space              = false  # bool | optional
  password_length            = 0      # number | optional
  require_each_included_type = false  # bool | optional

  # random_password            = ""     # string | computed

}

