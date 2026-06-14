# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_service_discovery_public_dns_namespace          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_service_discovery_public_dns_namespace" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # hosted_zone = ""     # string | computed

}

