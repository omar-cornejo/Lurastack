# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_outposts_assets                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_outposts_assets" "this" {

  arn              = ""     # string | required
  host_id_filter   = []     # set(string) | optional
  id               = ""     # string | optional+computed
  status_id_filter = []     # set(string) | optional

  # asset_ids        = []     # list(string) | computed

}

