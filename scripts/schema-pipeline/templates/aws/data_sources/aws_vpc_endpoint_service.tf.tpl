# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_endpoint_service                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_endpoint_service" "this" {

  id                            = ""     # string | optional+computed
  service                       = ""     # string | optional
  service_name                  = ""     # string | optional+computed
  service_regions               = []     # set(string) | optional
  service_type                  = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # acceptance_required           = false  # bool | computed
  # arn                           = ""     # string | computed
  # availability_zones            = []     # set(string) | computed
  # base_endpoint_dns_names       = []     # set(string) | computed
  # manages_vpc_endpoints         = false  # bool | computed
  # owner                         = ""     # string | computed
  # private_dns_name              = ""     # string | computed
  # private_dns_names             = []     # set(string) | computed
  # region                        = ""     # string | computed
  # service_id                    = ""     # string | computed
  # supported_ip_address_types    = []     # set(string) | computed
  # vpc_endpoint_policy_supported = false  # bool | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

