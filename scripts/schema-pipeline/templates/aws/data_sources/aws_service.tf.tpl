# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_service                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_service" "this" {

  dns_name           = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  region             = ""     # string | optional+computed
  reverse_dns_name   = ""     # string | optional+computed
  reverse_dns_prefix = ""     # string | optional+computed
  service_id         = ""     # string | optional+computed

  # partition          = ""     # string | computed
  # supported          = false  # bool | computed

}

