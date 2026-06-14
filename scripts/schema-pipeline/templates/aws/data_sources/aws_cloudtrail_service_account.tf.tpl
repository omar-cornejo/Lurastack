# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudtrail_service_account                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudtrail_service_account" "this" {

  id     = ""     # string | optional+computed
  region = ""     # string | optional

  # arn    = ""     # string | computed

}

