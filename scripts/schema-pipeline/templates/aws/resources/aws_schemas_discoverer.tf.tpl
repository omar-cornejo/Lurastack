# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_schemas_discoverer                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_schemas_discoverer" "this" {

  source_arn  = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}

