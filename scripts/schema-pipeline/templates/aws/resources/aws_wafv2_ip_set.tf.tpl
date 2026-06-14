# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafv2_ip_set                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafv2_ip_set" "this" {

  ip_address_version = ""     # string | required
  scope              = ""     # string | required
  addresses          = []     # set(string) | optional
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  name               = ""     # string | optional+computed
  name_prefix        = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # lock_token         = ""     # string | computed

}

