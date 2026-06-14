# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_public_key                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_public_key" "this" {

  encoded_key      = ""     # string | required
  comment          = ""     # string | optional
  id               = ""     # string | optional+computed
  name             = ""     # string | optional+computed
  name_prefix      = ""     # string | optional+computed

  # caller_reference = ""     # string | computed
  # etag             = ""     # string | computed

}

