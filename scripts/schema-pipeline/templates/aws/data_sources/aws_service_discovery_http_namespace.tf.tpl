# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_service_discovery_http_namespace                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_service_discovery_http_namespace" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # http_name   = ""     # string | computed

}

