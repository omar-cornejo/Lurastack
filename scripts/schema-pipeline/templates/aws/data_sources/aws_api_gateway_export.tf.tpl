# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_export                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_export" "this" {

  export_type         = ""     # string | required
  rest_api_id         = ""     # string | required
  stage_name          = ""     # string | required
  accepts             = ""     # string | optional
  id                  = ""     # string | optional+computed
  parameters          = {}     # map(string) | optional

  # body                = ""     # string | computed
  # content_disposition = ""     # string | computed
  # content_type        = ""     # string | computed

}

