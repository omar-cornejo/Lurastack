# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_athena_prepared_statement                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_athena_prepared_statement" "this" {

  name            = ""     # string | required
  query_statement = ""     # string | required
  workgroup       = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

