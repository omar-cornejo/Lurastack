# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_tag                                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_tag" "this" {

  key          = ""     # string | required
  resource_arn = ""     # string | required
  value        = ""     # string | required
  id           = ""     # string | optional+computed

}

