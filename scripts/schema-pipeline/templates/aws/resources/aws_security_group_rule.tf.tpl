# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_security_group_rule                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_security_group_rule" "this" {

  from_port                = 0      # number | required
  protocol                 = ""     # string | required
  security_group_id        = ""     # string | required
  to_port                  = 0      # number | required
  type                     = ""     # string | required
  cidr_blocks              = []     # list(string) | optional
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  ipv6_cidr_blocks         = []     # list(string) | optional
  prefix_list_ids          = []     # list(string) | optional
  self                     = false  # bool | optional
  source_security_group_id = ""     # string | optional+computed

  # security_group_rule_id   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

