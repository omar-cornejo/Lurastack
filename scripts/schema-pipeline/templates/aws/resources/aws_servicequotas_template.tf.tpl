# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicequotas_template                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicequotas_template" "this" {

  quota_code   = ""     # string | required
  region       = ""     # string | required
  service_code = ""     # string | required
  value        = 0      # number | required

  # global_quota = false  # bool | computed
  # id           = ""     # string | computed
  # quota_name   = ""     # string | computed
  # service_name = ""     # string | computed
  # unit         = ""     # string | computed

}

