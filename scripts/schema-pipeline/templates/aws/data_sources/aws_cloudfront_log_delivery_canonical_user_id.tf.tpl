# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_log_delivery_canonical_user_id           │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_log_delivery_canonical_user_id" "this" {

  id     = ""     # string | optional+computed
  region = ""     # string | optional

}

