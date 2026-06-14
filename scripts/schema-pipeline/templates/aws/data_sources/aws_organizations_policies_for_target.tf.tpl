# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_policies_for_target                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_policies_for_target" "this" {

  filter    = ""     # string | required
  target_id = ""     # string | required
  id        = ""     # string | optional+computed

  # ids       = []     # list(string) | computed

}

