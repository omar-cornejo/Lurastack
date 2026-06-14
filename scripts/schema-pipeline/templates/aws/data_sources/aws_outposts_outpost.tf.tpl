# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_outposts_outpost                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_outposts_outpost" "this" {

  arn                     = ""     # string | optional+computed
  id                      = ""     # string | optional+computed
  name                    = ""     # string | optional+computed
  owner_id                = ""     # string | optional
  tags                    = {}     # map(string) | optional+computed

  # availability_zone       = ""     # string | computed
  # availability_zone_id    = ""     # string | computed
  # description             = ""     # string | computed
  # lifecycle_status        = ""     # string | computed
  # site_arn                = ""     # string | computed
  # site_id                 = ""     # string | computed
  # supported_hardware_type = ""     # string | computed

}

