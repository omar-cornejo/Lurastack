# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_apigatewayv2_vpc_link                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_apigatewayv2_vpc_link" "this" {

  vpc_link_id        = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # name               = ""     # string | computed
  # security_group_ids = []     # set(string) | computed
  # subnet_ids         = []     # set(string) | computed

}

