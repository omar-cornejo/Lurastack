# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_apigatewayv2_apis                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_apigatewayv2_apis" "this" {

  id            = ""     # string | optional+computed
  name          = ""     # string | optional
  protocol_type = ""     # string | optional
  tags          = {}     # map(string) | optional

  # ids           = []     # set(string) | computed

}

