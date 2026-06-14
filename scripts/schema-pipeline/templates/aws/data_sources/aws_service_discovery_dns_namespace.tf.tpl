# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_service_discovery_dns_namespace                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_service_discovery_dns_namespace" "this" {

  name        = ""     # string | required
  type        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # hosted_zone = ""     # string | computed

}

