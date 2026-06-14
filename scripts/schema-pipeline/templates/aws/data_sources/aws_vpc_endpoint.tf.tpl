# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_endpoint                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_endpoint" "this" {

  id                    = ""     # string | optional+computed
  service_name          = ""     # string | optional+computed
  state                 = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional+computed
  vpc_id                = ""     # string | optional+computed

  # arn                   = ""     # string | computed
  # cidr_blocks           = []     # list(string) | computed
  # dns_entry = [  # list(object)
  #   {
  #     dns_name = ""
  #     hosted_zone_id = ""
  #   }
  # ]
  # dns_options = [  # list(object)
  #   {
  #     dns_record_ip_type = ""
  #     private_dns_only_for_inbound_resolver_endpoint = false
  #   }
  # ]
  # ip_address_type       = ""     # string | computed
  # network_interface_ids = []     # set(string) | computed
  # owner_id              = ""     # string | computed
  # policy                = ""     # string | computed
  # prefix_list_id        = ""     # string | computed
  # private_dns_enabled   = false  # bool | computed
  # requester_managed     = false  # bool | computed
  # route_table_ids       = []     # set(string) | computed
  # security_group_ids    = []     # set(string) | computed
  # subnet_ids            = []     # set(string) | computed
  # vpc_endpoint_type     = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

