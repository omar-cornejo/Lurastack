# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_distribution                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_distribution" "this" {

  id                             = ""     # string | required
  tags                           = {}     # map(string) | optional+computed

  # aliases                        = []     # set(string) | computed
  # arn                            = ""     # string | computed
  # domain_name                    = ""     # string | computed
  # enabled                        = false  # bool | computed
  # etag                           = ""     # string | computed
  # hosted_zone_id                 = ""     # string | computed
  # in_progress_validation_batches = 0      # number | computed
  # last_modified_time             = ""     # string | computed
  # status                         = ""     # string | computed
  # web_acl_id                     = ""     # string | computed

}

