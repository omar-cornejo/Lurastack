# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_table_item                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_table_item" "this" {

  hash_key   = ""     # string | required
  item       = ""     # string | required
  table_name = ""     # string | required
  id         = ""     # string | optional+computed
  range_key  = ""     # string | optional

}

