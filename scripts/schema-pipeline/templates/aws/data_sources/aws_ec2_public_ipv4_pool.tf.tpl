# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_public_ipv4_pool                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_public_ipv4_pool" "this" {

  pool_id                       = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # description                   = ""     # string | computed
  # network_border_group          = ""     # string | computed
  # pool_address_ranges = [  # list(object)
  #   {
  #     address_count = 0
  #     available_address_count = 0
  #     first_address = ""
  #     last_address = ""
  #   }
  # ]
  # total_address_count           = 0      # number | computed
  # total_available_address_count = 0      # number | computed

}

