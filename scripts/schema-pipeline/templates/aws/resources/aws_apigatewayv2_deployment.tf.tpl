# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_deployment                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_deployment" "this" {

  api_id        = ""     # string | required
  description   = ""     # string | optional
  id            = ""     # string | optional+computed
  triggers      = {}     # map(string) | optional

  # auto_deployed = false  # bool | computed

}

