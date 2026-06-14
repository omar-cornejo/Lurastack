# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_default_network_acl                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_default_network_acl" "this" {

  default_network_acl_id = ""     # string | required
  id                     = ""     # string | optional+computed
  subnet_ids             = []     # set(string) | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # owner_id               = ""     # string | computed
  # vpc_id                 = ""     # string | computed

  egress { # set
    action          = ""     # string | required
    from_port       = 0      # number | required
    protocol        = ""     # string | required
    rule_no         = 0      # number | required
    to_port         = 0      # number | required
    cidr_block      = ""     # string | optional
    icmp_code       = 0      # number | optional
    icmp_type       = 0      # number | optional
    ipv6_cidr_block = ""     # string | optional

  }

  ingress { # set
    action          = ""     # string | required
    from_port       = 0      # number | required
    protocol        = ""     # string | required
    rule_no         = 0      # number | required
    to_port         = 0      # number | required
    cidr_block      = ""     # string | optional
    icmp_code       = 0      # number | optional
    icmp_type       = 0      # number | optional
    ipv6_cidr_block = ""     # string | optional

  }

}

