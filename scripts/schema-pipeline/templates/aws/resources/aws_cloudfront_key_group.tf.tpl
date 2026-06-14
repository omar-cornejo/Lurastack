# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_key_group                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_key_group" "this" {

  items   = []     # set(string) | required
  name    = ""     # string | required
  comment = ""     # string | optional
  id      = ""     # string | optional+computed

  # etag    = ""     # string | computed

}

