# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_origin_access_identities                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_origin_access_identities" "this" {

  comments              = []     # set(string) | optional
  id                    = ""     # string | optional+computed

  # iam_arns              = []     # set(string) | computed
  # ids                   = []     # set(string) | computed
  # s3_canonical_user_ids = []     # set(string) | computed

}

