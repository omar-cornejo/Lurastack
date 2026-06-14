# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafv2_web_acl_association                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafv2_web_acl_association" "this" {

  resource_arn = ""     # string | required
  web_acl_arn  = ""     # string | required
  id           = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional

  }

}

