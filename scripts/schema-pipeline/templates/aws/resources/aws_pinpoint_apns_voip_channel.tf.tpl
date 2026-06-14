# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_apns_voip_channel                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_apns_voip_channel" "this" {

  application_id                = ""     # string | required
  bundle_id                     = ""     # string | optional+sensitive
  certificate                   = ""     # string | optional+sensitive
  default_authentication_method = ""     # string | optional
  enabled                       = false  # bool | optional
  id                            = ""     # string | optional+computed
  private_key                   = ""     # string | optional+sensitive
  team_id                       = ""     # string | optional+sensitive
  token_key                     = ""     # string | optional+sensitive
  token_key_id                  = ""     # string | optional+sensitive

}

