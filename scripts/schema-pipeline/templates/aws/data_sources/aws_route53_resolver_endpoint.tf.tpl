# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_endpoint                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_endpoint" "this" {

  id                     = ""     # string | optional+computed
  resolver_endpoint_id   = ""     # string | optional

  # arn                    = ""     # string | computed
  # direction              = ""     # string | computed
  # ip_addresses           = []     # set(string) | computed
  # name                   = ""     # string | computed
  # protocols              = []     # set(string) | computed
  # resolver_endpoint_type = ""     # string | computed
  # status                 = ""     # string | computed
  # vpc_id                 = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

