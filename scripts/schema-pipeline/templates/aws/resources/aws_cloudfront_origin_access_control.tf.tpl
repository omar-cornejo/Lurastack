# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_origin_access_control                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_origin_access_control" "this" {

  name                              = ""     # string | required
  origin_access_control_origin_type = ""     # string | required
  signing_behavior                  = ""     # string | required
  signing_protocol                  = ""     # string | required
  description                       = ""     # string | optional
  id                                = ""     # string | optional+computed

  # arn                               = ""     # string | computed
  # etag                              = ""     # string | computed

}

