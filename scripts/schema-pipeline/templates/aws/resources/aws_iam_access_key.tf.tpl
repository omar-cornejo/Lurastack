# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_access_key                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_access_key" "this" {

  user                           = ""     # string | required
  id                             = ""     # string | optional+computed
  pgp_key                        = ""     # string | optional
  status                         = ""     # string | optional

  # create_date                    = ""     # string | computed
  # encrypted_secret               = ""     # string | computed
  # encrypted_ses_smtp_password_v4 = ""     # string | computed
  # key_fingerprint                = ""     # string | computed
  # secret                         = ""     # string | computed+sensitive
  # ses_smtp_password_v4           = ""     # string | computed+sensitive

}

