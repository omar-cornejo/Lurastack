# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lb_trust_store                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_lb_trust_store" "this" {

  arn  = ""     # string | optional+computed
  id   = ""     # string | optional+computed
  name = ""     # string | optional+computed

}

