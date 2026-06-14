# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_access_log_subscription              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_access_log_subscription" "this" {

  destination_arn          = ""     # string | required
  resource_identifier      = ""     # string | required
  id                       = ""     # string | optional+computed
  service_network_log_type = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # resource_arn             = ""     # string | computed

}

