# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_alias                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_alias" "this" {

  target_key_id  = ""     # string | required
  id             = ""     # string | optional+computed
  name           = ""     # string | optional+computed
  name_prefix    = ""     # string | optional+computed

  # arn            = ""     # string | computed
  # target_key_arn = ""     # string | computed

}

