# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_athena_named_query                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_athena_named_query" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  workgroup   = ""     # string | optional

  # database    = ""     # string | computed
  # description = ""     # string | computed
  # querystring = ""     # string | computed

}

