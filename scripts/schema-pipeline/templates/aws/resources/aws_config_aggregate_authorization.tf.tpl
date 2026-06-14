# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_aggregate_authorization                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_aggregate_authorization" "this" {

  account_id = ""     # string | required
  region     = ""     # string | required
  id         = ""     # string | optional+computed
  tags       = {}     # map(string) | optional
  tags_all   = {}     # map(string) | optional+computed

  # arn        = ""     # string | computed

}

