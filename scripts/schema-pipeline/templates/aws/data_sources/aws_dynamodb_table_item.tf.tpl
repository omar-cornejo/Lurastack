# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dynamodb_table_item                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_dynamodb_table_item" "this" {

  key                        = ""     # string | required
  table_name                 = ""     # string | required
  expression_attribute_names = {}     # map(string) | optional
  id                         = ""     # string | optional+computed
  projection_expression      = ""     # string | optional

  # item                       = ""     # string | computed

}

