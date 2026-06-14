# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_domain_mail_from                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_domain_mail_from" "this" {

  domain                 = ""     # string | required
  mail_from_domain       = ""     # string | required
  behavior_on_mx_failure = ""     # string | optional
  id                     = ""     # string | optional+computed

}

