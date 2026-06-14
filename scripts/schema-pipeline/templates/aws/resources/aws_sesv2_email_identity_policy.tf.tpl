# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_email_identity_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_email_identity_policy" "this" {

  email_identity = ""     # string | required
  policy         = ""     # string | required
  policy_name    = ""     # string | required
  id             = ""     # string | optional+computed

}

