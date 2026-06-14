# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_waf_web_acl                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_waf_web_acl" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

}

