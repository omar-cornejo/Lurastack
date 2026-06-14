# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_ipam_pools                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_ipam_pools" "this" {

  id         = ""     # string | optional+computed

  # ipam_pools = [  # set(object)
  #   {
  #     address_family = ""
  #     allocation_default_netmask_length = 0
  #     allocation_max_netmask_length = 0
  #     allocation_min_netmask_length = 0
  #     allocation_resource_tags = {}  # map(string)
  #     arn = ""
  #     auto_import = false
  #     aws_service = ""
  #     description = ""
  #     id = ""
  #     ipam_scope_id = ""
  #     ipam_scope_type = ""
  #     locale = ""
  #     pool_depth = 0
  #     publicly_advertisable = false
  #     source_ipam_pool_id = ""
  #     state = ""
  #     tags = {}  # map(string)
  #   }
  # ]

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

