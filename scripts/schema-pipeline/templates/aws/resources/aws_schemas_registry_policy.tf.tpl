# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_schemas_registry_policy                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_schemas_registry_policy" "this" {

  policy        = ""     # string | required
  registry_name = ""     # string | required
  id            = ""     # string | optional+computed

}

