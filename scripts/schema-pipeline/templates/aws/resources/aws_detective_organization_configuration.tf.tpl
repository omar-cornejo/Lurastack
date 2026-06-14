# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_detective_organization_configuration            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_detective_organization_configuration" "this" {

  auto_enable = false  # bool | required
  graph_arn   = ""     # string | required
  id          = ""     # string | optional+computed

}

