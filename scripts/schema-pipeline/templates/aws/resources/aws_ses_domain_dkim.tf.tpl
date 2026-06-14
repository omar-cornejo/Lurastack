# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_domain_dkim                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_domain_dkim" "this" {

  domain      = ""     # string | required
  id          = ""     # string | optional+computed

  # dkim_tokens = []     # list(string) | computed

}

