# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_type                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_type" "this" {

  api_id      = ""     # string | required
  definition  = ""     # string | required
  format      = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # name        = ""     # string | computed

}

