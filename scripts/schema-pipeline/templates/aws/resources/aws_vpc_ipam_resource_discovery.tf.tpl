# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_resource_discovery                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_resource_discovery" "this" {

  description                    = ""     # string | optional
  id                             = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed
  # ipam_resource_discovery_region = ""     # string | computed
  # is_default                     = false  # bool | computed
  # owner_id                       = ""     # string | computed

  operating_regions { # set [1..*]
    region_name = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

