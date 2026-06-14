# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_resource_discovery_association         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_resource_discovery_association" "this" {

  ipam_id                    = ""     # string | required
  ipam_resource_discovery_id = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # ipam_arn                   = ""     # string | computed
  # ipam_region                = ""     # string | computed
  # is_default                 = false  # bool | computed
  # owner_id                   = ""     # string | computed
  # state                      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

