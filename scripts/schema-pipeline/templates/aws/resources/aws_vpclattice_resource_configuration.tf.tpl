# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_resource_configuration               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_resource_configuration" "this" {

  name                                           = ""     # string | required
  allow_association_to_shareable_service_network = false  # bool | optional+computed
  port_ranges                                    = []     # set(string) | optional+computed
  protocol                                       = ""     # string | optional+computed
  resource_configuration_group_id                = ""     # string | optional
  resource_gateway_identifier                    = ""     # string | optional+computed
  tags                                           = {}     # map(string) | optional
  type                                           = ""     # string | optional+computed

  # arn                                            = ""     # string | computed
  # id                                             = ""     # string | computed
  # tags_all                                       = {}     # map(string) | computed

  resource_configuration_definition { # list

    arn_resource { # list
      arn = ""     # string | required

    }

    dns_resource { # list
      domain_name     = ""     # string | required
      ip_address_type = ""     # string | required

    }

    ip_resource { # list
      ip_address = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

