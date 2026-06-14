# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_wafv2_web_acl                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_wafv2_web_acl" "this" {

  name        = ""     # string | required
  scope       = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed

}

