# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_msk_vpc_connection                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_msk_vpc_connection" "this" {

  arn                = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # authentication     = ""     # string | computed
  # client_subnets     = []     # set(string) | computed
  # security_groups    = []     # set(string) | computed
  # target_cluster_arn = ""     # string | computed
  # vpc_id             = ""     # string | computed

}

