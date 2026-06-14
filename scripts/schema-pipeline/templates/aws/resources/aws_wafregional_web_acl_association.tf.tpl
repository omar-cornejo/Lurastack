# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_web_acl_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_web_acl_association" "this" {

  resource_arn = ""     # string | required
  web_acl_id   = ""     # string | required
  id           = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional

  }

}

