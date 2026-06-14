# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_model                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_model" "this" {

  content_type = ""     # string | required
  name         = ""     # string | required
  rest_api_id  = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  schema       = ""     # string | optional

}

