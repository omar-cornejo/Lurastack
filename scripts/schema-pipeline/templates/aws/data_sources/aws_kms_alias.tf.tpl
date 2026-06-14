# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kms_alias                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_kms_alias" "this" {

  name           = ""     # string | required
  id             = ""     # string | optional+computed

  # arn            = ""     # string | computed
  # target_key_arn = ""     # string | computed
  # target_key_id  = ""     # string | computed

}

