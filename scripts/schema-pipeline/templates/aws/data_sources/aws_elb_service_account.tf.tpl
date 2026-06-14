# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elb_service_account                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_elb_service_account" "this" {

  id     = ""     # string | optional+computed
  region = ""     # string | optional

  # arn    = ""     # string | computed

}

