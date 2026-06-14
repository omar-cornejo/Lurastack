# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ce_cost_allocation_tag                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ce_cost_allocation_tag" "this" {

  status  = ""     # string | required
  tag_key = ""     # string | required
  id      = ""     # string | optional+computed

  # type    = ""     # string | computed

}

