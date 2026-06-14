# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appfabric_app_bundle                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appfabric_app_bundle" "this" {

  customer_managed_key_arn = ""     # string | optional
  tags                     = {}     # map(string) | optional

  # arn                      = ""     # string | computed
  # id                       = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed

}

