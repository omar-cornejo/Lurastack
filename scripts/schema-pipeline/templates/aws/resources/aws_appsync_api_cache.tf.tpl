# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_api_cache                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_api_cache" "this" {

  api_caching_behavior       = ""     # string | required
  api_id                     = ""     # string | required
  ttl                        = 0      # number | required
  type                       = ""     # string | required
  at_rest_encryption_enabled = false  # bool | optional
  id                         = ""     # string | optional+computed
  transit_encryption_enabled = false  # bool | optional

}

