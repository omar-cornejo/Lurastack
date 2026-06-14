# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_user_pool_domain                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_user_pool_domain" "this" {

  domain                          = ""     # string | required
  user_pool_id                    = ""     # string | required
  certificate_arn                 = ""     # string | optional
  id                              = ""     # string | optional+computed
  managed_login_version           = 0      # number | optional+computed

  # aws_account_id                  = ""     # string | computed
  # cloudfront_distribution         = ""     # string | computed
  # cloudfront_distribution_arn     = ""     # string | computed
  # cloudfront_distribution_zone_id = ""     # string | computed
  # s3_bucket                       = ""     # string | computed
  # version                         = ""     # string | computed

}

