# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_security_group                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_security_group" "this" {

  description            = ""     # string | optional
  egress                 = []     # set of object | optional+computed
  id                     = ""     # string | optional+computed
  ingress                = []     # set of object | optional+computed
  name                   = ""     # string | optional+computed
  name_prefix            = ""     # string | optional+computed
  revoke_rules_on_delete = false  # bool | optional
  tags                   = {}     # map of string | optional
  tags_all               = {}     # map of string | optional+computed
  vpc_id                 = ""     # string | optional+computed
  # arn                    = ... # string | computed
  # owner_id               = ... # string | computed

  timeouts {
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

