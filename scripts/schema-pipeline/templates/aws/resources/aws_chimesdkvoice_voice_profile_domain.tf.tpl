# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chimesdkvoice_voice_profile_domain              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chimesdkvoice_voice_profile_domain" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # id          = ""     # string | computed

  server_side_encryption_configuration { # list [1..1]
    kms_key_arn = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

