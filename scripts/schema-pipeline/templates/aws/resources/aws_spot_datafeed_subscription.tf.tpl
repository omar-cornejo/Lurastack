# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_spot_datafeed_subscription                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_spot_datafeed_subscription" "this" {

  bucket = ""     # string | required
  id     = ""     # string | optional+computed
  prefix = ""     # string | optional

}

