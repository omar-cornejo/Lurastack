# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sesv2_email_identity_mail_from_attributes           │
# └──────────────────────────────────────────────────────────────┘
data "aws_sesv2_email_identity_mail_from_attributes" "this" {

  email_identity         = ""     # string | required
  id                     = ""     # string | optional+computed

  # behavior_on_mx_failure = ""     # string | computed
  # mail_from_domain       = ""     # string | computed

}

