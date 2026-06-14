# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_adm_channel                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_adm_channel" "this" {

  application_id = ""     # string | required
  client_id      = ""     # string | required+sensitive
  client_secret  = ""     # string | required+sensitive
  enabled        = false  # bool | optional
  id             = ""     # string | optional+computed

}

