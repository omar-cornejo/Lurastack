# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_registry                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_registry" "this" {

  registry_name = ""     # string | required
  description   = ""     # string | optional
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed

}

