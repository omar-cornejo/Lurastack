# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_query_definition                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_query_definition" "this" {

  name                = ""     # string | required
  query_string        = ""     # string | required
  id                  = ""     # string | optional+computed
  log_group_names     = []     # list(string) | optional

  # query_definition_id = ""     # string | computed

}

