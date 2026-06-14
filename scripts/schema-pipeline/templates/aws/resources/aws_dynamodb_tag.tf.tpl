# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_tag                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_tag" "this" {

  key          = ""     # string | required
  resource_arn = ""     # string | required
  value        = ""     # string | required
  id           = ""     # string | optional+computed

}

