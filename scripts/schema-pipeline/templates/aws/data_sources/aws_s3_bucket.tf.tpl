# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_s3_bucket                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_s3_bucket" "this" {

  bucket                      = ""     # string | required
  id                          = ""     # string | optional+computed

  # arn                         = ""     # string | computed
  # bucket_domain_name          = ""     # string | computed
  # bucket_regional_domain_name = ""     # string | computed
  # hosted_zone_id              = ""     # string | computed
  # region                      = ""     # string | computed
  # website_domain              = ""     # string | computed
  # website_endpoint            = ""     # string | computed

}

