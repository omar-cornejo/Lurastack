# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3outposts_endpoint                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3outposts_endpoint" "this" {

  outpost_id               = ""     # string | required
  security_group_id        = ""     # string | required
  subnet_id                = ""     # string | required
  access_type              = ""     # string | optional+computed
  customer_owned_ipv4_pool = ""     # string | optional
  id                       = ""     # string | optional+computed

  # arn                      = ""     # string | computed
  # cidr_block               = ""     # string | computed
  # creation_time            = ""     # string | computed
  # network_interfaces = [  # set(object)
  #   {
  #     network_interface_id = ""
  #   }
  # ]

}

