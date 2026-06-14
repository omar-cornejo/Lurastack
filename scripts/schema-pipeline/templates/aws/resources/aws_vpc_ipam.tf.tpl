# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam" "this" {

  cascade                                   = false  # bool | optional
  description                               = ""     # string | optional
  enable_private_gua                        = false  # bool | optional
  id                                        = ""     # string | optional+computed
  tags                                      = {}     # map(string) | optional
  tags_all                                  = {}     # map(string) | optional+computed
  tier                                      = ""     # string | optional

  # arn                                       = ""     # string | computed
  # default_resource_discovery_association_id = ""     # string | computed
  # default_resource_discovery_id             = ""     # string | computed
  # private_default_scope_id                  = ""     # string | computed
  # public_default_scope_id                   = ""     # string | computed
  # scope_count                               = 0      # number | computed

  operating_regions { # set [1..*]
    region_name = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

