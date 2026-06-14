# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_synthetics_group                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_synthetics_group" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # group_id = ""     # string | computed

}

