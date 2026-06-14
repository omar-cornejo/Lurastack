# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_security_group_egress_rule                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_security_group_egress_rule" "this" {

  ip_protocol                  = ""     # string | required
  security_group_id            = ""     # string | required
  cidr_ipv4                    = ""     # string | optional
  cidr_ipv6                    = ""     # string | optional
  description                  = ""     # string | optional
  from_port                    = 0      # number | optional
  prefix_list_id               = ""     # string | optional
  referenced_security_group_id = ""     # string | optional
  tags                         = {}     # map(string) | optional
  to_port                      = 0      # number | optional

  # arn                          = ""     # string | computed
  # id                           = ""     # string | computed
  # security_group_rule_id       = ""     # string | computed
  # tags_all                     = {}     # map(string) | computed

}

