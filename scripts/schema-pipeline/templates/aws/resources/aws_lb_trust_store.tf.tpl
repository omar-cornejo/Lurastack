# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_trust_store                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_trust_store" "this" {

  ca_certificates_bundle_s3_bucket         = ""     # string | required
  ca_certificates_bundle_s3_key            = ""     # string | required
  ca_certificates_bundle_s3_object_version = ""     # string | optional
  id                                       = ""     # string | optional+computed
  name                                     = ""     # string | optional+computed
  name_prefix                              = ""     # string | optional+computed
  tags                                     = {}     # map(string) | optional
  tags_all                                 = {}     # map(string) | optional+computed

  # arn                                      = ""     # string | computed
  # arn_suffix                               = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

