# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_service_discovery_http_namespace                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_service_discovery_http_namespace" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # http_name   = ""     # string | computed

}

