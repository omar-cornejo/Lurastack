# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_contributor_insights                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_contributor_insights" "this" {

  table_name = ""     # string | required
  id         = ""     # string | optional+computed
  index_name = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

