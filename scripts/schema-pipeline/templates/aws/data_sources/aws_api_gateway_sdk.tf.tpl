# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_sdk                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_sdk" "this" {

  rest_api_id         = ""     # string | required
  sdk_type            = ""     # string | required
  stage_name          = ""     # string | required
  id                  = ""     # string | optional+computed
  parameters          = {}     # map(string) | optional

  # body                = ""     # string | computed
  # content_disposition = ""     # string | computed
  # content_type        = ""     # string | computed

}

