# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_query_log_config                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_query_log_config" "this" {

  id                           = ""     # string | optional+computed
  name                         = ""     # string | optional
  resolver_query_log_config_id = ""     # string | optional
  tags                         = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # destination_arn              = ""     # string | computed
  # owner_id                     = ""     # string | computed
  # share_status                 = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

