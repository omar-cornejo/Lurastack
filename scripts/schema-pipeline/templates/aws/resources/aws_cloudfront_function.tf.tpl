# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_function                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_function" "this" {

  code                         = ""     # string | required
  name                         = ""     # string | required
  runtime                      = ""     # string | required
  comment                      = ""     # string | optional
  id                           = ""     # string | optional+computed
  key_value_store_associations = []     # set(string) | optional
  publish                      = false  # bool | optional

  # arn                          = ""     # string | computed
  # etag                         = ""     # string | computed
  # live_stage_etag              = ""     # string | computed
  # status                       = ""     # string | computed

}

