# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_outposts_asset                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_outposts_asset" "this" {

  arn            = ""     # string | required
  asset_id       = ""     # string | required
  id             = ""     # string | optional+computed

  # asset_type     = ""     # string | computed
  # host_id        = ""     # string | computed
  # rack_elevation = 0      # number | computed
  # rack_id        = ""     # string | computed

}

