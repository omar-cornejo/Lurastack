# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_signer_signing_profile                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_signer_signing_profile" "this" {

  platform_id           = ""     # string | required
  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional+computed
  name_prefix           = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # platform_display_name = ""     # string | computed
  # revocation_record = [  # list(object)
  #   {
  #     revocation_effective_from = ""
  #     revoked_at = ""
  #     revoked_by = ""
  #   }
  # ]
  # status                = ""     # string | computed
  # version               = ""     # string | computed
  # version_arn           = ""     # string | computed

  signature_validity_period { # list [0..1]
    type  = ""     # string | required
    value = 0      # number | required

  }

  signing_material { # list [0..1]
    certificate_arn = ""     # string | required

  }

}

