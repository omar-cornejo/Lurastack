# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_schema                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_schema" "this" {

  compatibility         = ""     # string | required
  data_format           = ""     # string | required
  schema_definition     = ""     # string | required
  schema_name           = ""     # string | required
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  registry_arn          = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # latest_schema_version = 0      # number | computed
  # next_schema_version   = 0      # number | computed
  # registry_name         = ""     # string | computed
  # schema_checkpoint     = 0      # number | computed

}

