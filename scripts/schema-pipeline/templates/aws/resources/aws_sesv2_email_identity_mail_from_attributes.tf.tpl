# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_email_identity_mail_from_attributes       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_email_identity_mail_from_attributes" "this" {

  email_identity         = ""     # string | required
  behavior_on_mx_failure = ""     # string | optional
  id                     = ""     # string | optional+computed
  mail_from_domain       = ""     # string | optional

}

