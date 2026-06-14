# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_partition                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_partition" "this" {

  id                 = ""     # string | optional+computed

  # dns_suffix         = ""     # string | computed
  # partition          = ""     # string | computed
  # reverse_dns_prefix = ""     # string | computed

}

