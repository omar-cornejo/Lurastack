# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_domain_identity                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_domain_identity" "this" {

  domain             = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed
  # verification_token = ""     # string | computed

}

