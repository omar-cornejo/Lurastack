# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector_resource_group                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector_resource_group" "this" {

  tags = {}     # map(string) | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

}

