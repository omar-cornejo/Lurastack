# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_security_group_rule                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_security_group_rule" "this" {

  security_group_rule_id       = ""     # string | optional+computed

  # arn                          = ""     # string | computed
  # cidr_ipv4                    = ""     # string | computed
  # cidr_ipv6                    = ""     # string | computed
  # description                  = ""     # string | computed
  # from_port                    = 0      # number | computed
  # id                           = ""     # string | computed
  # ip_protocol                  = ""     # string | computed
  # is_egress                    = false  # bool | computed
  # prefix_list_id               = ""     # string | computed
  # referenced_security_group_id = ""     # string | computed
  # security_group_id            = ""     # string | computed
  # tags                         = {}     # map(string) | computed
  # to_port                      = 0      # number | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

