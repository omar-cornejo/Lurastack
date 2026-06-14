# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_service_network_vpc_association      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_service_network_vpc_association" "this" {

  service_network_identifier = ""     # string | required
  vpc_identifier             = ""     # string | required
  id                         = ""     # string | optional+computed
  security_group_ids         = []     # list(string) | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # created_by                 = ""     # string | computed
  # status                     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

