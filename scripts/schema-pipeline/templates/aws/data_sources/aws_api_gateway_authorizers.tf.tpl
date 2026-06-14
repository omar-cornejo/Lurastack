# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_authorizers                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_authorizers" "this" {

  rest_api_id = ""     # string | required
  id          = ""     # string | optional+computed

  # ids         = []     # list(string) | computed

}

