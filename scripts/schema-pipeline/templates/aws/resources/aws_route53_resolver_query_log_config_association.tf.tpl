# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_resolver_query_log_config_association   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_resolver_query_log_config_association" "this" {

  resolver_query_log_config_id = ""     # string | required
  resource_id                  = ""     # string | required
  id                           = ""     # string | optional+computed

}

