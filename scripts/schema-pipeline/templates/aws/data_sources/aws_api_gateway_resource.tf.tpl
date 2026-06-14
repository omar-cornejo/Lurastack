# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_resource                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_resource" "this" {

  path        = ""     # string | required
  rest_api_id = ""     # string | required
  id          = ""     # string | optional+computed

  # parent_id   = ""     # string | computed
  # path_part   = ""     # string | computed

}

