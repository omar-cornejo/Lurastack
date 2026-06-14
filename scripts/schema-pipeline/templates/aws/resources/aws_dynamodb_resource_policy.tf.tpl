# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_resource_policy                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_resource_policy" "this" {

  policy                              = ""     # string | required
  resource_arn                        = ""     # string | required
  confirm_remove_self_resource_access = false  # bool | optional+computed

  # id                                  = ""     # string | computed
  # revision_id                         = ""     # string | computed

}

