# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_ipams                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_ipams" "this" {

  ipam_ids = []     # list(string) | optional

  # ipams = [  # list(object)
  #   {
  #     arn = ""
  #     default_resource_discovery_association_id = ""
  #     default_resource_discovery_id = ""
  #     description = ""
  #     enable_private_gua = false
  #     id = ""
  #     ipam_region = ""
  #     operating_regions = [  # list(object)
  #       {
  #         region_name = ""
  #       }
  #     ]
  #     owner_id = ""
  #     private_default_scope_id = ""
  #     public_default_scope_id = ""
  #     resource_discovery_association_count = 0
  #     scope_count = 0
  #     state = ""
  #     state_message = ""
  #     tier = ""
  #   }
  # ]

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

