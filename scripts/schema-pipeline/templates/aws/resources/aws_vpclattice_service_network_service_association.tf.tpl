# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_service_network_service_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_service_network_service_association" "this" {

  service_identifier         = ""     # string | required
  service_network_identifier = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # created_by                 = ""     # string | computed
  # custom_domain_name         = ""     # string | computed
  # dns_entry = [  # list(object)
  #   {
  #     domain_name = ""
  #     hosted_zone_id = ""
  #   }
  # ]
  # status                     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

