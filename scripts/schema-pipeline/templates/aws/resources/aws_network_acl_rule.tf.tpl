# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_acl_rule                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_acl_rule" "this" {

  network_acl_id  = ""     # string | required
  protocol        = ""     # string | required
  rule_action     = ""     # string | required
  rule_number     = 0      # number | required
  cidr_block      = ""     # string | optional
  egress          = false  # bool | optional
  from_port       = 0      # number | optional
  icmp_code       = 0      # number | optional
  icmp_type       = 0      # number | optional
  id              = ""     # string | optional+computed
  ipv6_cidr_block = ""     # string | optional
  to_port         = 0      # number | optional

}

