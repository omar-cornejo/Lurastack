# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_login_profile                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_login_profile" "this" {

  user                    = ""     # string | required
  id                      = ""     # string | optional+computed
  password_length         = 0      # number | optional
  password_reset_required = false  # bool | optional+computed
  pgp_key                 = ""     # string | optional

  # encrypted_password      = ""     # string | computed
  # key_fingerprint         = ""     # string | computed
  # password                = ""     # string | computed+sensitive

}

