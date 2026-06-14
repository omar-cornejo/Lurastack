# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_transit_gateway_peering_attachments             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_transit_gateway_peering_attachments" "this" {

  id  = ""     # string | optional+computed

  # ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

