# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_vpc_link                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_vpc_link" "this" {

  name               = ""     # string | required
  security_group_ids = []     # set(string) | required
  subnet_ids         = []     # set(string) | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

}

