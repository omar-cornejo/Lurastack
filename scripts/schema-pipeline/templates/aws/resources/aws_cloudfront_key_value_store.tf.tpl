# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_key_value_store                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_key_value_store" "this" {

  name               = ""     # string | required
  comment            = ""     # string | optional

  # arn                = ""     # string | computed
  # etag               = ""     # string | computed
  # id                 = ""     # string | computed
  # last_modified_time = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

