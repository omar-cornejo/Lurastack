# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_customer_gateway                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_customer_gateway" "this" {

  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # bgp_asn          = 0      # number | computed
  # bgp_asn_extended = 0      # number | computed
  # certificate_arn  = ""     # string | computed
  # device_name      = ""     # string | computed
  # ip_address       = ""     # string | computed
  # type             = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

