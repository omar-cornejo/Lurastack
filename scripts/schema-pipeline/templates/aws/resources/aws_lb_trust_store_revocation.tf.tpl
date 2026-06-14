# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_trust_store_revocation                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_trust_store_revocation" "this" {

  revocations_s3_bucket         = ""     # string | required
  revocations_s3_key            = ""     # string | required
  trust_store_arn               = ""     # string | required
  id                            = ""     # string | optional+computed
  revocations_s3_object_version = ""     # string | optional

  # revocation_id                 = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

