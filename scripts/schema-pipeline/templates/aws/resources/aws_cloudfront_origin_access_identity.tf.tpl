# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_origin_access_identity               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_origin_access_identity" "this" {

  comment                         = ""     # string | optional
  id                              = ""     # string | optional+computed

  # arn                             = ""     # string | computed
  # caller_reference                = ""     # string | computed
  # cloudfront_access_identity_path = ""     # string | computed
  # etag                            = ""     # string | computed
  # iam_arn                         = ""     # string | computed
  # s3_canonical_user_id            = ""     # string | computed

}

