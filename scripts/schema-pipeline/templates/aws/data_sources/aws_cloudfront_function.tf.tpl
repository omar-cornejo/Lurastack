# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_function                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_function" "this" {

  name                         = ""     # string | required
  stage                        = ""     # string | required
  id                           = ""     # string | optional+computed

  # arn                          = ""     # string | computed
  # code                         = ""     # string | computed
  # comment                      = ""     # string | computed
  # etag                         = ""     # string | computed
  # key_value_store_associations = []     # set(string) | computed
  # last_modified_time           = ""     # string | computed
  # runtime                      = ""     # string | computed
  # status                       = ""     # string | computed

}

