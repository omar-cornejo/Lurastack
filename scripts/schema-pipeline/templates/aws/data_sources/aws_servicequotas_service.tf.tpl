# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicequotas_service                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicequotas_service" "this" {

  service_name = ""     # string | required
  id           = ""     # string | optional+computed

  # service_code = ""     # string | computed

}

