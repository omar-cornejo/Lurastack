# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_ipam                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_ipam" "this" {

  id                                        = ""     # string | required

  # arn                                       = ""     # string | computed
  # default_resource_discovery_association_id = ""     # string | computed
  # default_resource_discovery_id             = ""     # string | computed
  # description                               = ""     # string | computed
  # enable_private_gua                        = false  # bool | computed
  # ipam_region                               = ""     # string | computed
  # operating_regions = [  # list(object)
  #   {
  #     region_name = ""
  #   }
  # ]
  # owner_id                                  = ""     # string | computed
  # private_default_scope_id                  = ""     # string | computed
  # public_default_scope_id                   = ""     # string | computed
  # resource_discovery_association_count      = 0      # number | computed
  # scope_count                               = 0      # number | computed
  # state                                     = ""     # string | computed
  # state_message                             = ""     # string | computed
  # tags                                      = {}     # map(string) | computed
  # tier                                      = ""     # string | computed

}

