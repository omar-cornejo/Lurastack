# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iot_endpoint                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_iot_endpoint" "this" {

  endpoint_type    = ""     # string | optional
  id               = ""     # string | optional+computed

  # endpoint_address = ""     # string | computed

}

