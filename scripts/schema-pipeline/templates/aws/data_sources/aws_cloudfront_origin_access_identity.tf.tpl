# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_origin_access_identity                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_origin_access_identity" "this" {

  id                              = ""     # string | required

  # arn                             = ""     # string | computed
  # caller_reference                = ""     # string | computed
  # cloudfront_access_identity_path = ""     # string | computed
  # comment                         = ""     # string | computed
  # etag                            = ""     # string | computed
  # iam_arn                         = ""     # string | computed
  # s3_canonical_user_id            = ""     # string | computed

}

