# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_gcm_channel                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_gcm_channel" "this" {

  application_id                = ""     # string | required
  api_key                       = ""     # string | optional+sensitive
  default_authentication_method = ""     # string | optional
  enabled                       = false  # bool | optional
  id                            = ""     # string | optional+computed
  service_json                  = ""     # string | optional+sensitive

}

