# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_query_log_config               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_query_log_config" "this" {

  destination_arn = ""     # string | required
  name            = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # owner_id        = ""     # string | computed
  # share_status    = ""     # string | computed

}

