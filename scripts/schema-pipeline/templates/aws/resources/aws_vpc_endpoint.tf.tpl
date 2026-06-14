# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint" "this" {

  vpc_id                     = ""     # string | required
  auto_accept                = false  # bool | optional
  id                         = ""     # string | optional+computed
  ip_address_type            = ""     # string | optional+computed
  policy                     = ""     # string | optional+computed
  private_dns_enabled        = false  # bool | optional+computed
  resource_configuration_arn = ""     # string | optional
  route_table_ids            = []     # set(string) | optional+computed
  security_group_ids         = []     # set(string) | optional+computed
  service_name               = ""     # string | optional
  service_network_arn        = ""     # string | optional
  service_region             = ""     # string | optional+computed
  subnet_ids                 = []     # set(string) | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed
  vpc_endpoint_type          = ""     # string | optional

  # arn                        = ""     # string | computed
  # cidr_blocks                = []     # list(string) | computed
  # dns_entry = [  # list(object)
  #   {
  #     dns_name = ""
  #     hosted_zone_id = ""
  #   }
  # ]
  # network_interface_ids      = []     # set(string) | computed
  # owner_id                   = ""     # string | computed
  # prefix_list_id             = ""     # string | computed
  # requester_managed          = false  # bool | computed
  # state                      = ""     # string | computed

  dns_options { # list [0..1]
    dns_record_ip_type                             = ""     # string | optional+computed
    private_dns_only_for_inbound_resolver_endpoint = false  # bool | optional

  }

  subnet_configuration { # set
    ipv4      = ""     # string | optional
    ipv6      = ""     # string | optional
    subnet_id = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

