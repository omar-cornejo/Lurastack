# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_agreement                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_agreement" "this" {

  access_role        = ""     # string | required
  base_directory     = ""     # string | required
  local_profile_id   = ""     # string | required
  partner_profile_id = ""     # string | required
  server_id          = ""     # string | required
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # agreement_id       = ""     # string | computed
  # arn                = ""     # string | computed
  # status             = ""     # string | computed

}

