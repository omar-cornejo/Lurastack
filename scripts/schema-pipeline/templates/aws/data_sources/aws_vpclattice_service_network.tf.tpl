# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpclattice_service_network                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpclattice_service_network" "this" {

  service_network_identifier    = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # auth_type                     = ""     # string | computed
  # created_at                    = ""     # string | computed
  # last_updated_at               = ""     # string | computed
  # name                          = ""     # string | computed
  # number_of_associated_services = 0      # number | computed
  # number_of_associated_vpcs     = 0      # number | computed

}

