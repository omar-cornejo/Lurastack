# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkfirewall_resource_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkfirewall_resource_policy" "this" {

  policy       = ""     # string | required
  resource_arn = ""     # string | required
  id           = ""     # string | optional+computed

}

