# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_policies                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_policies" "this" {

  filter = ""     # string | required
  id     = ""     # string | optional+computed

  # ids    = []     # list(string) | computed

}

