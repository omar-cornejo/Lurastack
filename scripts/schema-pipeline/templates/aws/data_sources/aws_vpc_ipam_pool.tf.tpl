# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_ipam_pool                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_ipam_pool" "this" {

  allocation_resource_tags          = {}     # map(string) | optional+computed
  id                                = ""     # string | optional
  ipam_pool_id                      = ""     # string | optional
  tags                              = {}     # map(string) | optional+computed

  # address_family                    = ""     # string | computed
  # allocation_default_netmask_length = 0      # number | computed
  # allocation_max_netmask_length     = 0      # number | computed
  # allocation_min_netmask_length     = 0      # number | computed
  # arn                               = ""     # string | computed
  # auto_import                       = false  # bool | computed
  # aws_service                       = ""     # string | computed
  # description                       = ""     # string | computed
  # ipam_scope_id                     = ""     # string | computed
  # ipam_scope_type                   = ""     # string | computed
  # locale                            = ""     # string | computed
  # pool_depth                        = 0      # number | computed
  # publicly_advertisable             = false  # bool | computed
  # source_ipam_pool_id               = ""     # string | computed
  # state                             = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

