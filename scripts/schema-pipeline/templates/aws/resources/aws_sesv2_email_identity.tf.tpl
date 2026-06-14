# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_email_identity                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_email_identity" "this" {

  email_identity              = ""     # string | required
  configuration_set_name      = ""     # string | optional
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # identity_type               = ""     # string | computed
  # verified_for_sending_status = false  # bool | computed

  dkim_signing_attributes { # list [0..1]
    domain_signing_private_key    = ""     # string | optional+sensitive
    domain_signing_selector       = ""     # string | optional
    next_signing_key_length       = ""     # string | optional+computed

    # current_signing_key_length    = ""     # string | computed
    # last_key_generation_timestamp = ""     # string | computed
    # signing_attributes_origin     = ""     # string | computed
    # status                        = ""     # string | computed
    # tokens                        = []     # list(string) | computed

  }

}

