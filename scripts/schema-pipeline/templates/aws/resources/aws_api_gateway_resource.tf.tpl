# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_resource                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_resource" "this" {

  parent_id   = ""     # string | required
  path_part   = ""     # string | required
  rest_api_id = ""     # string | required
  id          = ""     # string | optional+computed

  # path        = ""     # string | computed

}

