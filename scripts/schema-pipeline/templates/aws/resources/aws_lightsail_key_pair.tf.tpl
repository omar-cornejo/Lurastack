# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_key_pair                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_key_pair" "this" {

  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional+computed
  name_prefix           = ""     # string | optional+computed
  pgp_key               = ""     # string | optional
  public_key            = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # encrypted_fingerprint = ""     # string | computed
  # encrypted_private_key = ""     # string | computed
  # fingerprint           = ""     # string | computed
  # private_key           = ""     # string | computed

}

