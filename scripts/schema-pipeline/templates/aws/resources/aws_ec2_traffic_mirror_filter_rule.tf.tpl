# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_traffic_mirror_filter_rule                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_traffic_mirror_filter_rule" "this" {

  destination_cidr_block   = ""     # string | required
  rule_action              = ""     # string | required
  rule_number              = 0      # number | required
  source_cidr_block        = ""     # string | required
  traffic_direction        = ""     # string | required
  traffic_mirror_filter_id = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  protocol                 = 0      # number | optional

  # arn                      = ""     # string | computed

  destination_port_range { # list [0..1]
    from_port = 0      # number | optional
    to_port   = 0      # number | optional

  }

  source_port_range { # list [0..1]
    from_port = 0      # number | optional
    to_port   = 0      # number | optional

  }

}

