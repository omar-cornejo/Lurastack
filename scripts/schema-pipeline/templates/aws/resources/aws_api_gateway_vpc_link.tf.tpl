# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_vpc_link                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_vpc_link" "this" {

  name        = ""     # string | required
  target_arns = []     # list(string) | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}

