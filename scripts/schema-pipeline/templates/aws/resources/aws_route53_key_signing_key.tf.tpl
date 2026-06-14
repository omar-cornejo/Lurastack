# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_key_signing_key                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_key_signing_key" "this" {

  hosted_zone_id             = ""     # string | required
  key_management_service_arn = ""     # string | required
  name                       = ""     # string | required
  id                         = ""     # string | optional+computed
  status                     = ""     # string | optional

  # digest_algorithm_mnemonic  = ""     # string | computed
  # digest_algorithm_type      = 0      # number | computed
  # digest_value               = ""     # string | computed
  # dnskey_record              = ""     # string | computed
  # ds_record                  = ""     # string | computed
  # flag                       = 0      # number | computed
  # key_tag                    = 0      # number | computed
  # public_key                 = ""     # string | computed
  # signing_algorithm_mnemonic = ""     # string | computed
  # signing_algorithm_type     = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

