# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_domain_name_api_association             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_domain_name_api_association" "this" {

  api_id      = ""     # string | required
  domain_name = ""     # string | required
  id          = ""     # string | optional+computed

}

