# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_delegation_set                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_delegation_set" "this" {

  id             = ""     # string | optional+computed
  reference_name = ""     # string | optional

  # arn            = ""     # string | computed
  # name_servers   = []     # list(string) | computed

}

