# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafv2_ip_set                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafv2_ip_set" "this" {

  name               = ""     # string | required
  scope              = ""     # string | required
  id                 = ""     # string | optional+computed

  # addresses          = []     # set(string) | computed
  # arn                = ""     # string | computed
  # description        = ""     # string | computed
  # ip_address_version = ""     # string | computed

}

