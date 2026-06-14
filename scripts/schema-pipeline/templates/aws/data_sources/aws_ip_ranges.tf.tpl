# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ip_ranges                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ip_ranges" "this" {

  services         = []     # set(string) | required
  id               = ""     # string | optional+computed
  regions          = []     # set(string) | optional
  url              = ""     # string | optional

  # cidr_blocks      = []     # list(string) | computed
  # create_date      = ""     # string | computed
  # ipv6_cidr_blocks = []     # list(string) | computed
  # sync_token       = 0      # number | computed

}

