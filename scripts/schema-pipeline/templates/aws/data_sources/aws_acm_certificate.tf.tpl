# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_acm_certificate                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_acm_certificate" "this" {

  domain            = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  key_types         = []     # set(string) | optional
  most_recent       = false  # bool | optional
  statuses          = []     # list(string) | optional
  tags              = {}     # map(string) | optional+computed
  types             = []     # list(string) | optional

  # arn               = ""     # string | computed
  # certificate       = ""     # string | computed
  # certificate_chain = ""     # string | computed
  # status            = ""     # string | computed

}

