# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_service_network_resource_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_service_network_resource_association" "this" {

  resource_configuration_identifier = ""     # string | required
  service_network_identifier        = ""     # string | required
  tags                              = {}     # map(string) | optional

  # arn                               = ""     # string | computed
  # dns_entry = [  # list(object)
  #   {
  #     domain_name = ""
  #     hosted_zone_id = ""
  #   }
  # ]
  # id                                = ""     # string | computed
  # tags_all                          = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

