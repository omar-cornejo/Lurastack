# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_query_log                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_query_log" "this" {

  cloudwatch_log_group_arn = ""     # string | required
  zone_id                  = ""     # string | required
  id                       = ""     # string | optional+computed

  # arn                      = ""     # string | computed

}

