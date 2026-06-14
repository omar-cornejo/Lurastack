# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lb_hosted_zone_id                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_lb_hosted_zone_id" "this" {

  id                 = ""     # string | optional+computed
  load_balancer_type = ""     # string | optional
  region             = ""     # string | optional

}

