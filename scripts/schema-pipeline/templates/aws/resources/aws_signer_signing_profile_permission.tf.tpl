# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_signer_signing_profile_permission               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_signer_signing_profile_permission" "this" {

  action              = ""     # string | required
  principal           = ""     # string | required
  profile_name        = ""     # string | required
  id                  = ""     # string | optional+computed
  profile_version     = ""     # string | optional+computed
  statement_id        = ""     # string | optional+computed
  statement_id_prefix = ""     # string | optional+computed

}

