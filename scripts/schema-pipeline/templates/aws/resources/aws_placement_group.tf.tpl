# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_placement_group                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_placement_group" "this" {

  name               = ""     # string | required
  strategy           = ""     # string | required
  id                 = ""     # string | optional+computed
  partition_count    = 0      # number | optional+computed
  spread_level       = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # placement_group_id = ""     # string | computed

}

