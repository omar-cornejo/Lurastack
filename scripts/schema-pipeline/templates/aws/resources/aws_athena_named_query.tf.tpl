# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_athena_named_query                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_athena_named_query" "this" {

  database    = ""     # string | required
  name        = ""     # string | required
  query       = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  workgroup   = ""     # string | optional

}

