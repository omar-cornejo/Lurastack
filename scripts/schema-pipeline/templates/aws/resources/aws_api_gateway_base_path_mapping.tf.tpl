# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_base_path_mapping                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_base_path_mapping" "this" {

  api_id         = ""     # string | required
  domain_name    = ""     # string | required
  base_path      = ""     # string | optional
  domain_name_id = ""     # string | optional
  id             = ""     # string | optional+computed
  stage_name     = ""     # string | optional

}

