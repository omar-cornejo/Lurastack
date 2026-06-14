# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_vpc_link                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_vpc_link" "this" {

  name           = ""     # string | required
  tags           = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # description    = ""     # string | computed
  # id             = ""     # string | computed
  # status         = ""     # string | computed
  # status_message = ""     # string | computed
  # target_arns    = []     # set(string) | computed

}

