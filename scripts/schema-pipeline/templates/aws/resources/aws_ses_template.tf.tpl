# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_template                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_template" "this" {

  name    = ""     # string | required
  html    = ""     # string | optional
  id      = ""     # string | optional+computed
  subject = ""     # string | optional
  text    = ""     # string | optional

  # arn     = ""     # string | computed

}

