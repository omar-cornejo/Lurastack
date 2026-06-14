# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_synthetics_group_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_synthetics_group_association" "this" {

  canary_arn = ""     # string | required
  group_name = ""     # string | required
  id         = ""     # string | optional+computed

  # group_arn  = ""     # string | computed
  # group_id   = ""     # string | computed

}

