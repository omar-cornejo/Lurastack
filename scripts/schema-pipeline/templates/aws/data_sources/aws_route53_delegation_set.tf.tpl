# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_delegation_set                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_delegation_set" "this" {

  id               = ""     # string | required

  # arn              = ""     # string | computed
  # caller_reference = ""     # string | computed
  # name_servers     = []     # list(string) | computed

}

