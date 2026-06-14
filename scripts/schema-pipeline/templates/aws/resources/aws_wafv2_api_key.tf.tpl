# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafv2_api_key                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafv2_api_key" "this" {

  scope         = ""     # string | required | Specifies whether this is for an AWS CloudFront distribution…
  token_domains = []     # set(string) | required | The domains that you want to be able to use the API key with…

  # api_key       = ""     # string | computed+sensitive | The API key value. This is sensitive and not included in res…

}

