# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpclattice_service                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpclattice_service" "this" {

  id                 = ""     # string | optional+computed
  name               = ""     # string | optional+computed
  service_identifier = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # auth_type          = ""     # string | computed
  # certificate_arn    = ""     # string | computed
  # custom_domain_name = ""     # string | computed
  # dns_entry = [  # list(object)
  #   {
  #     domain_name = ""
  #     hosted_zone_id = ""
  #   }
  # ]
  # status             = ""     # string | computed

}

