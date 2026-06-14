# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_origin_access_control                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_origin_access_control" "this" {

  id                                = ""     # string | required

  # arn                               = ""     # string | computed
  # description                       = ""     # string | computed
  # etag                              = ""     # string | computed
  # name                              = ""     # string | computed
  # origin_access_control_origin_type = ""     # string | computed
  # signing_behavior                  = ""     # string | computed
  # signing_protocol                  = ""     # string | computed

}

