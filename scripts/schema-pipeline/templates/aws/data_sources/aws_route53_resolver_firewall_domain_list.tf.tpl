# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_resolver_firewall_domain_list               │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_resolver_firewall_domain_list" "this" {

  firewall_domain_list_id = ""     # string | required
  id                      = ""     # string | optional+computed

  # arn                     = ""     # string | computed
  # creation_time           = ""     # string | computed
  # creator_request_id      = ""     # string | computed
  # domain_count            = 0      # number | computed
  # managed_owner_name      = ""     # string | computed
  # modification_time       = ""     # string | computed
  # name                    = ""     # string | computed
  # status                  = ""     # string | computed
  # status_message          = ""     # string | computed

}

