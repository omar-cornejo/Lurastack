# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_api_key                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_api_key" "this" {

  api_id      = ""     # string | required
  description = ""     # string | optional
  expires     = ""     # string | optional
  id          = ""     # string | optional+computed

  # api_key_id  = ""     # string | computed
  # key         = ""     # string | computed+sensitive

}

