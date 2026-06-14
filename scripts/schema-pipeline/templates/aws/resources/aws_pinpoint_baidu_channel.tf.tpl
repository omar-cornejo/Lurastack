# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_baidu_channel                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_baidu_channel" "this" {

  api_key        = ""     # string | required+sensitive
  application_id = ""     # string | required
  secret_key     = ""     # string | required+sensitive
  enabled        = false  # bool | optional
  id             = ""     # string | optional+computed

}

