# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_account_password_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_account_password_policy" "this" {

  allow_users_to_change_password = false  # bool | optional
  hard_expiry                    = false  # bool | optional+computed
  id                             = ""     # string | optional+computed
  max_password_age               = 0      # number | optional+computed
  minimum_password_length        = 0      # number | optional
  password_reuse_prevention      = 0      # number | optional+computed
  require_lowercase_characters   = false  # bool | optional+computed
  require_numbers                = false  # bool | optional+computed
  require_symbols                = false  # bool | optional+computed
  require_uppercase_characters   = false  # bool | optional+computed

  # expire_passwords               = false  # bool | computed

}

