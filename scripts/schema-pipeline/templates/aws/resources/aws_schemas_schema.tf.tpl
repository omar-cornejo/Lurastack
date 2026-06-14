# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_schemas_schema                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_schemas_schema" "this" {

  content              = ""     # string | required
  name                 = ""     # string | required
  registry_name        = ""     # string | required
  type                 = ""     # string | required
  description          = ""     # string | optional
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # last_modified        = ""     # string | computed
  # version              = ""     # string | computed
  # version_created_date = ""     # string | computed

}

