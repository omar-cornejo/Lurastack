# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elb_hosted_zone_id                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_elb_hosted_zone_id" "this" {

  id     = ""     # string | optional+computed
  region = ""     # string | optional

}

