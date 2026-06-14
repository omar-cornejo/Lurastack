# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ses_email_identity                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ses_email_identity" "this" {

  email = ""     # string | required
  id    = ""     # string | optional+computed

  # arn   = ""     # string | computed

}

