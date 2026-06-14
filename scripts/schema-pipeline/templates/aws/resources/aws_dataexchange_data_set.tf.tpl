# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dataexchange_data_set                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dataexchange_data_set" "this" {

  asset_type  = ""     # string | required
  description = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}

