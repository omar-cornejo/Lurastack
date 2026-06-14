# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_documentation_version               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_documentation_version" "this" {

  rest_api_id = ""     # string | required
  version     = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed

}

