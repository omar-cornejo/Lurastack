# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_certificate                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_certificate" "this" {

  certificate       = ""     # string | required+sensitive
  usage             = ""     # string | required
  certificate_chain = ""     # string | optional+sensitive
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  private_key       = ""     # string | optional+sensitive
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # active_date       = ""     # string | computed
  # arn               = ""     # string | computed
  # certificate_id    = ""     # string | computed
  # inactive_date     = ""     # string | computed

}

