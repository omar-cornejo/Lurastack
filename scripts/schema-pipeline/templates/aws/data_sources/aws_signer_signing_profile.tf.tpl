# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_signer_signing_profile                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_signer_signing_profile" "this" {

  name                      = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # platform_display_name     = ""     # string | computed
  # platform_id               = ""     # string | computed
  # revocation_record = [  # list(object)
  #   {
  #     revocation_effective_from = ""
  #     revoked_at = ""
  #     revoked_by = ""
  #   }
  # ]
  # signature_validity_period = [  # list(object)
  #   {
  #     type = ""
  #     value = 0
  #   }
  # ]
  # status                    = ""     # string | computed
  # version                   = ""     # string | computed
  # version_arn               = ""     # string | computed

}

