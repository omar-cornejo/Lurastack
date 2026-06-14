# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sesv2_email_identity                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_sesv2_email_identity" "this" {

  email_identity              = ""     # string | required
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # configuration_set_name      = ""     # string | computed
  # dkim_signing_attributes = [  # list(object)
  #   {
  #     current_signing_key_length = ""
  #     domain_signing_private_key = ""
  #     domain_signing_selector = ""
  #     last_key_generation_timestamp = ""
  #     next_signing_key_length = ""
  #     signing_attributes_origin = ""
  #     status = ""
  #     tokens = []  # list(string)
  #   }
  # ]
  # identity_type               = ""     # string | computed
  # verified_for_sending_status = false  # bool | computed

}

