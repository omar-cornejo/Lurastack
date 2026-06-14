# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_pool                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_pool" "this" {

  address_family                    = ""     # string | required
  ipam_scope_id                     = ""     # string | required
  allocation_default_netmask_length = 0      # number | optional
  allocation_max_netmask_length     = 0      # number | optional
  allocation_min_netmask_length     = 0      # number | optional
  allocation_resource_tags          = {}     # map(string) | optional
  auto_import                       = false  # bool | optional
  aws_service                       = ""     # string | optional
  cascade                           = false  # bool | optional
  description                       = ""     # string | optional
  id                                = ""     # string | optional+computed
  locale                            = ""     # string | optional
  public_ip_source                  = ""     # string | optional
  publicly_advertisable             = false  # bool | optional
  source_ipam_pool_id               = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # ipam_scope_type                   = ""     # string | computed
  # pool_depth                        = 0      # number | computed
  # state                             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

