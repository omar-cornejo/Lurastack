# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_resource_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_resource_policy" "this" {

  policy        = ""     # string | required
  enable_hybrid = ""     # string | optional
  id            = ""     # string | optional+computed

}

