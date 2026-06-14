# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_service                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_service" "this" {

  name               = ""     # string | required
  auth_type          = ""     # string | optional+computed
  certificate_arn    = ""     # string | optional
  custom_domain_name = ""     # string | optional
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # dns_entry = [  # list(object)
  #   {
  #     domain_name = ""
  #     hosted_zone_id = ""
  #   }
  # ]
  # status             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

