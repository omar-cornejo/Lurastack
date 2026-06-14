# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_service                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_service" "this" {

  acceptance_required            = false  # bool | required
  allowed_principals             = []     # set(string) | optional+computed
  gateway_load_balancer_arns     = []     # set(string) | optional
  id                             = ""     # string | optional+computed
  network_load_balancer_arns     = []     # set(string) | optional
  private_dns_name               = ""     # string | optional+computed
  supported_ip_address_types     = []     # set(string) | optional+computed
  supported_regions              = []     # set(string) | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed
  # availability_zones             = []     # set(string) | computed
  # base_endpoint_dns_names        = []     # set(string) | computed
  # manages_vpc_endpoints          = false  # bool | computed
  # private_dns_name_configuration = [  # list(object)
  #   {
  #     name = ""
  #     state = ""
  #     type = ""
  #     value = ""
  #   }
  # ]
  # service_name                   = ""     # string | computed
  # service_type                   = ""     # string | computed
  # state                          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

